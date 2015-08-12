class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :type

      t.timestamps null: true
    end
  end
end
