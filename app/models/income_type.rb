class IncomeType < ActiveRecord::Base
  has_many :incomes
  has_many :expenses
  has_many :goals
end
