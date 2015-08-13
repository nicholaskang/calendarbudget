class RemoveStartingBalanceAndStartingBalanceAsOfInIncomesTable < ActiveRecord::Migration
  def change
  	remove_column :incomes, :balance_amount, :integer
  	remove_column :incomes, :starting_balance_as_of, :date
  end
end
