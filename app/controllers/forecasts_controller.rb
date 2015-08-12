class ForecastsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @user = current_user
  end

  def new
  end
 
  def edit
    user = params[:id]
    @user = User.find_by(id: params[:id])
    @income = Income.find_by(params[:id])
    @expense = Expense.find_by(params[:id])
  end

  def update
    user = params[:id]
    @user = User.find_by(id: params[:id])

    income = Income.update( 
      income_type_id: params[:income_type_id], 
      income_amount: params[:income_amount], 
      frequency_id: params[:frequency_id], 
      income_start_date: params[:income_start_date], 
      income_end_date: params[:income_end_date])

   expenses = Expense.update(expense_type_id: params[:expense_type_id], expense_amount: params[:expense_amount], frequency_id: params[:frequency_id], expense_start_date: params[:expense_start_date], expense_end_date: params[:expense_end_date])

    redirect_to "/forecasts"
  end

  def destroy
    redirect_to "/forecasts"
  end

  def create
    balance = StartingBalance.create(
      user_id: current_user.id, 
      balance_amount: params[:balance_amount], 
      starting_balance_as_of: Date.today,
      )
    income_start_date = params[:i_start_date].map{|k,v| v}.join("-").to_date
    income_end_date = params[:i_end_date].map{|k,v| v}.join("-").to_date
    income = Income.create(
      user_id: current_user.id,
      income_type_id: params[:income_type_id], 
      income_amount: params[:income_amount], 
      frequency_id: params[:frequency_id], 
      income_start_date: income_start_date, 
      income_end_date: income_end_date
      )
    expense_start_date = params[:e_start_date].map{|k,v| v}.join("-").to_date
    expense_end_date = params[:e_end_date].map{|k,v| v}.join("-").to_date
    expense = Expense.create(
      user_id: current_user.id,
      expense_type_id: params[:expense_type_id], 
      expense_amount: params[:expense_amount], 
      frequency_id: params[:frequency_id], 
      expense_start_date: expense_start_date, 
      expense_end_date: expense_end_date
      )
    redirect_to "/forecasts"
  end

  def show
    @user = User.find(params[:id])
    @starting_balance_hash = starting_balance_to_hash(@user.id)
    @starting_balance_array = starting_balance_to_array(@user.id)    
    @all_incomes = all_income_hashes_to_array(@user.id)
    @all_expenses = all_expense_hashes_to_array(@user.id)
    @dates = (@starting_balance_array[0].to_datetime..@starting_balance_array[0].to_datetime + 90).map{|date| date.strftime("%m-%d-%Y")}
    
    @balances = {}
    @dates.each do |date|
      balance = @starting_balance_array[1]
      if(@all_incomes[date])
        @all_incomes[date].each do |income|
          balance += income[:income_amount]
        end
      end
      if(@all_expenses[date])
        @all_expenses[date].each do |expense|
          balance -= expense[:expense_amount]
        end
      end
      @balances[date] = balance
    end
    
  end

# ****************************************************************************************************************************************************************
  
  private 

  def all_income_hashes_to_array(user_id)
    @incomes = {}
    Income.where(user_id: user_id).each do |income_data|
      income_hash = compute_income_totals_for_a_date(income_data.income_amount, income_data.income_start_date, income_data.income_end_date, income_data.frequency_id, income_data.income_type_id)
      income_hash.each do |k, v|
        if @incomes[k]
          @incomes[k].push({income_amount: v})
        else
          @incomes[k] = [{income_amount: v}]
        end
      end
    end  
    @incomes
  end

  def compute_income_totals_for_a_date(income_amount, start_date, end_date, frequency_id, income_type_id)
    income_start_date = start_date.to_datetime + 1
    income_end_date = end_date.to_datetime + 1
    schedule = IceCube::Schedule.new(start = Time.parse(income_start_date.to_s))
    if frequency_id == 4
      rule = IceCube::Rule.monthly
    elsif frequency_id == 3
      rule = IceCube::Rule.weekly(2)
    elsif frequency_id == 2
      rule = IceCube::Rule.weekly
    elsif frequency_id == 1
      rule = IceCube::Rule.daily
    else
      rule = IceCube::Rule.monthly
    end
    schedule.add_recurrence_rule rule
    occurrences = schedule.occurrences(Time.parse(income_end_date.to_s))
    income_hash = {}
    occurrences.each do |occurrence|
      income_hash[occurrence.strftime("%m-%d-%Y")] = income_amount 
    end
    income_hash
  end

  def all_expense_hashes_to_array(user_id)
    @expenses = {}
    Expense.where(user_id: user_id).each do |expense_data|
      expense_hash = compute_expense_totals_for_a_date(expense_data.expense_amount, expense_data.expense_start_date, expense_data.expense_end_date, expense_data.frequency_id, expense_data.expense_type_id)
      expense_hash.each do |k, v|
        if @expenses[k]
          @expenses[k].push({expense_amount: v})
        else
          @expenses[k] = [{expense_amount: v}]
        end
      end
    end  
    p @expenses
  end

  def compute_expense_totals_for_a_date(expense_amount, start_date, end_date, frequency_id, expense_type_id)
    expense_start_date = start_date.to_datetime + 1
    expense_end_date = end_date.to_datetime + 1
    schedule = IceCube::Schedule.new(start = Time.parse(expense_start_date.to_s))
    if frequency_id == 4
      rule = IceCube::Rule.monthly
    elsif frequency_id == 3
      rule = IceCube::Rule.weekly(2)
    elsif frequency_id == 2
      rule = IceCube::Rule.weekly
    elsif frequency_id == 1
      rule = IceCube::Rule.daily
    else
      rule = IceCube::Rule.monthly
    end
    schedule.add_recurrence_rule rule
    occurrences = schedule.occurrences(Time.parse(expense_end_date.to_s))
    expense_hash = {}
    occurrences.each do |occurrence|
      expense_hash[occurrence.strftime("%m-%d-%Y")] = expense_amount
    end
    expense_hash
  end

  def starting_balance_to_hash(user_id)
    starting_balance_data = StartingBalance.find_by(user_id: user_id)
    @starting_balance_hash = {starting_balance_data.starting_balance_as_of => starting_balance_data.balance_amount}
  end

  def starting_balance_to_array(user_id)
    starting_balance_data = StartingBalance.find_by(user_id: user_id)
    @starting_balance_array = [starting_balance_data.starting_balance_as_of.strftime("%m-%d-%Y"), starting_balance_data.balance_amount]
  end
end