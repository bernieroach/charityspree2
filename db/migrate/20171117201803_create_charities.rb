class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :amount
      t.timestamps
    end
  end
end

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

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.timestamps
    end
  end
end

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
