class Api::V1::IncomesController < ApplicationController
  skip_before_filter :verify_authenticity_token   
  # to have current_user to save through API calls

  def index
    @incomes = current_user.incomes
  end

  def create
    income_start_date = params[:income_start_date].to_datetime - 5.hours
    puts income_start_date
    income_end_date = params[:income_end_date].to_date
    Income.create(
        user_id: current_user.id,
        income_type_id: params[:income_type_id], 
        income_amount: params[:income_amount], 
        frequency_id: params[:frequency_id], 
        income_start_date: income_start_date, 
        income_end_date: income_end_date
        )
    alert = "Income Added!"
    render json: alert.to_json
  end

  def update
    start_date = params[:income_start_date].to_datetime - 5.hours
    Income.find_by(id: params[:id]).update(
        income_type_id: params[:income_type_id], 
        income_amount: params[:income_amount], 
        frequency_id: params[:frequency_id], 
        income_start_date: start_date, 
        income_end_date: params[:income_end_date]
        )
    alert = "Income Updated!"
    render json: alert.to_json  
  end

  def destroy
    Income.find_by(id: params[:id]).delete
    alert = "Income deleted!"
    render json: alert.to_json
  end
end