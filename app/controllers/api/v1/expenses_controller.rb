class Api::V1::ExpensesController < ApplicationController
  skip_before_filter :verify_authenticity_token   
  # to have current_user to save through API calls

  def index
    @expenses = current_user.expenses
  end

  def create
    expense_start_date = params[:expense_start_date].to_date
    expense_end_date = params[:expense_end_date].to_date

    Expense.create(
        user_id: current_user.id,
        expense_type_id: params[:expense_type_id], 
        expense_amount: params[:expense_amount], 
        frequency_id: params[:frequency_id], 
        expense_start_date: expense_start_date, 
        expense_end_date: expense_end_date
        )
    alert = "Expense Added!"
    render json: alert.to_json
  end

  def update
    #make sure this is correct
    Expense.find_by(id: params[:id]).update(
        expense_type_id: params[:expense_type_id], 
        expense_amount: params[:expense_amount], 
        frequency_id: params[:frequency_id], 
        expense_start_date: params[:expense_start_date], 
        expense_end_date: params[:expense_end_date]
        )
    alert = "Expense Updated!"
    render json: alert.to_json  
  end

  def destroy
    Expense.find_by(id: params[:id]).delete
    alert = "Expense deleted!"
    render json: alert.to_json
  end
end