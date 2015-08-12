class Api::V1::FrequenciesController < ApplicationController
  def index
    @types = Frequency.all
  end
end
