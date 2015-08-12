class ChangeGoalsToHaveTotalGoalAmountAndGoalContributionAmount < ActiveRecord::Migration
  def change
    rename_column :goals, :amount, :total_amount 
  end
end
