class RenameStartAndEndDatesToIncludeIncomeExpenseOrGoalInFront < ActiveRecord::Migration
  def change
    rename_column :incomes, :start_date, :income_start_date
    rename_column :incomes, :end_date, :income_end_date
    rename_column :expenses, :start_date, :expense_start_date
    rename_column :expenses, :end_date, :expense_end_date
    rename_column :goals, :start_date, :goal_start_date
    rename_column :goals, :end_date, :goal_end_date
  end
end
