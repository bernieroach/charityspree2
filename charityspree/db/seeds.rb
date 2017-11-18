# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end


#####    CHARITIES    #####

puts "Re-creating Charities ..."

Charity.destroy_all

Charity.create!({
  name:  'Habitat for Humanity',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('habitat.jpg'),
  amount: 5200
})

Charity.create!({
  name:  'Canadian Cancer Society',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('css.jpg'),
  amount: 4800
})

Charity.create!({
  name:  'Deworm the World Initiative',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('deworm.jpg'),
  amount: 3100
})

Charity.create!({
  name:  'Agains Malaria Foundation',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('malaria.jpg'),
  amount: 4500
})

Charity.create!({
  name:  'Schistosomiasis Control Initiative',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('sci.jpg'),
  amount: 2300
})

Charity.create!({
  name:  'Sightsavers',
  description: Faker::Hipster.paragraph(6),
  image: open_asset('sightsavers.jpg'),
  amount: 1700
})


#######   ACHIEVEMENTS   ######

puts "Re-creating Achievements ..."

Achievement.destroy_all

Achievement.create!({
  title:  'Give your first 1 dollars',
  description: Faker::Hipster.paragraph(2),
  image: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
  progress: 1
})

Achievement.create!({
  title:  'Donate to unlock this 100 dollars achivement',
  description: Faker::Hipster.paragraph(2),
  image: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
  progress: 100
})


puts "DONE!"
