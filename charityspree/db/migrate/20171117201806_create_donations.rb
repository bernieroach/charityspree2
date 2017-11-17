

class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.references :users, index: true, foreign_key: true
      t.references :charities, index: true, foreign_key: true
      t.integer :quantity
      t.timestamps null: false
    end
  end
end

