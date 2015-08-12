class RenameExpenseAndIncomeAmountsToExpenseAmountAndIncomeAmount < ActiveRecord::Migration
  def change
    rename_column :incomes, :amount, :income_amount
    rename_column :expenses, :amount, :expense_amount
  end
end
