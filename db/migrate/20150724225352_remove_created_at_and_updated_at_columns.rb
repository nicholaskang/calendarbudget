class RemoveCreatedAtAndUpdatedAtColumns < ActiveRecord::Migration
  def change
    remove_column :starting_balances, :created_at, :datetime
    remove_column :starting_balances, :updated_at, :datetime
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    remove_column :incomes, :created_at, :datetime
    remove_column :incomes, :updated_at, :datetime
    remove_column :income_types, :created_at, :datetime
    remove_column :income_types, :updated_at, :datetime
    remove_column :frequencies, :created_at, :datetime
    remove_column :frequencies, :updated_at, :datetime
    remove_column :expenses, :created_at, :datetime
    remove_column :expenses, :updated_at, :datetime
    remove_column :expense_types, :created_at, :datetime
    remove_column :expense_types, :updated_at, :datetime

  end
end
