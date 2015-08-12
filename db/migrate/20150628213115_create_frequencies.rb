class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :value

      t.timestamps null: true
    end
  end
end
