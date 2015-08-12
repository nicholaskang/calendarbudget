class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :goal_type_id
      t.decimal :amount
      t.integer :frequency_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id

    end
  end
end
