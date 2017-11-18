
class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :progress
      t.timestamps
    end
  end
end
