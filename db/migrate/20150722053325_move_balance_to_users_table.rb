class MoveBalanceToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :balance_amount, :integer
    add_column :users, :starting_balance_as_of, :date
  end
end
