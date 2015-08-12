class CreateGoalTypes < ActiveRecord::Migration
  def change
    create_table :goal_types do |t|
      t.string :type

    end
  end
end
