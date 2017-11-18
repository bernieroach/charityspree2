

class CreateUserAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :user_achievements do |t|
      t.references :achievements, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true
      t.boolean :achieved
      t.integer :progress
      t.timestamps null: false
    end
  end
end
