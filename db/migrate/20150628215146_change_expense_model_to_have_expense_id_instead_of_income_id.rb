class ChangeExpenseModelToHaveExpenseIdInsteadOfIncomeId < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_type_id, :integer
    remove_column :expenses, :income_type_id
  end
end
