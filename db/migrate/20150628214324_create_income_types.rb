class CreateIncomeTypes < ActiveRecord::Migration
  def change
    create_table :income_types do |t|
      t.string :type

      t.timestamps null: true
    end
  end
end
