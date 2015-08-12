class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :income_type_id
      t.decimal :amount
      t.integer :frequency_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: true
    end
  end
end
