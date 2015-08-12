class ChangeAllTimeDataTypesFromDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :incomes, :income_start_date, :date
    change_column :incomes, :income_end_date, :date
    change_column :expenses, :expense_start_date, :date
    change_column :expenses, :expense_end_date, :date
    change_column :goals, :goal_start_date, :date
    change_column :goals, :goal_end_date, :date

  end
end
