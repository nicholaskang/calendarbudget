class Api::V1::StartingBalancesController < ApplicationController
  skip_before_filter :verify_authenticity_token   
 
  def index
    @balance_amount = current_user.starting_balance
  end
  
  def create
  end

  def update
  end

end
