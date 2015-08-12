class MoveBalanceAmountToIncomeTable < ActiveRecord::Migration
  def change
    remove_column :users, :balance_amount, :integer
    add_column :incomes, :balance_amount, :integer
  end
end
