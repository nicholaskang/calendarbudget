class Api::V1::ExpenseTypesController < ApplicationController
  def index
    @types = ExpenseType.all
  end
end
