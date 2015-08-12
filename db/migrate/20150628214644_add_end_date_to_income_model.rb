class AddEndDateToIncomeModel < ActiveRecord::Migration
  def change
    add_column :incomes, :end_date, :datetime
  end
end
