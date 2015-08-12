class ChangeIncomeExpenseAndGoalTypeColumnNameTypeToName < ActiveRecord::Migration
  def change
    rename_column :income_types, :type, :name 
    rename_column :expense_types, :type, :name 
    rename_column :goal_types, :type, :name 
  end
end
