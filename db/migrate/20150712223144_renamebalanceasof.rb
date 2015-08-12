class Renamebalanceasof < ActiveRecord::Migration
  def change
    rename_column :incomes, :balance_as_of, :starting_balance_as_of
  end
end
