class Api::V1::StartingBalancesController < ApplicationController
  skip_before_filter :verify_authenticity_token   
 
  def index
    @balance_amount = current_user.starting_balance
  end
  
  def create
  end

  def update
    StartingBalance.find_by(id: params[:id]).update(
      user_id: current_user.id, 
      balance_amount: params[:balance_amount], 
      starting_balance_as_of: params[:starting_balance_as_of],
      )
    alert = "Starting Balance Updated!"
    render json: alert.to_json   	
  end

end
