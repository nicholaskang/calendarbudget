class AddDateForStartingBalance < ActiveRecord::Migration
  def change
    add_column :incomes, :balance_as_of, :date
  end
end
