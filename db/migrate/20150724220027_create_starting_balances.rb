class CreateStartingBalances < ActiveRecord::Migration
  def change
    create_table :starting_balances do |t|
      t.integer :user_id
      t.integer :balance_amount
      t.date :starting_balance_as_of

      remove_column :users, :balance_amount, :integer
      remove_column :users, :starting_balance_as_of, :date

      t.timestamps
    end
  end
end
