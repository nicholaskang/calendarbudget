class Api::V1::IncomeTypesController < ApplicationController
  def index
    @types = IncomeType.all
  end
end
