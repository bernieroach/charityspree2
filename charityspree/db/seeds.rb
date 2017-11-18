# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."


## CHARITIES

puts "Re-creating Charities ..."

Charity.destroy_all

charity1 = Charity.create!({
  name: 'Amnesty International',
  description: 'Amnesty International (commonly known as Amnesty or AI) is a London-based non-governmental organisation focused on human rights. The organisation claims to have over 7 million members and supporters around the world.',
  amount: 0,
  image: '004-medieval-1.png'
})
charity2 = Charity.create!({
  name: 'Doctors Without Borders',
  description: 'Médecins Sans Frontières (MSF), also known in English as Doctors Without Borders, is an international humanitarian non-governmental organization (NGO) best known for its projects in war-torn regions and developing countries affected by endemic diseases.',
  amount: 0,
  image: '002-arrow.png'
})
charity3 = Charity.create!({
  name: 'Against Malaria Foundation',
  description: 'The Against Malaria Foundation (AMF) is a United Kingdom-based charity that provides long-lasting insecticidal nets (LLINs) to populations at high risk of malaria, primarily in Africa. As of July 2016, the foundation has raised $86.6 million and distributed or committed to fund 19.3 million LLINs since its founding in 2004.',
  amount: 0,
  image: '003-war.png'
})

## USERS

puts "Re-creating Users ..."
User.destroy_all

user1 = User.create!({
  first_name: Faker::Internet.user_name,
  last_name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(6)
})
user2 = User.create!({
  first_name: Faker::Internet.user_name,
  last_name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(6)
})

## ACHIEVEMENTS

user1.achievements.create!({
  title: 'Join Us, Join Us',
  description: 'Register on Charity Spree',
  progress: 1,
  image: 'app/assets/images/001-medieval-2.png'
})
user1.achievements.create!({
  title: 'Loose Change',
  description: 'Donate your first dollar to a charity of your choice',
  progress: 1,
  image: 'app/assets/images/002-arrow.png'
})
user1.achievements.create!({
  title: 'Big Spender',
  description: 'Donate five dollars to a charity of your choice',
  progress: 5,
  image: 'app/assets/images/003-war.png'
})
user2.achievements.create!({
  title: 'Join Us, Join Us',
  description: 'Register on Charity Spree',
  progress: 1,
  image: 'app/assets/images/001-medieval-2.png'
})

## DONATIONS

user1.donations.create!(amount: 1, charity_id: 1)
user1.donations.create!(amount: 5, charity_id: 2)





puts "DONE!"
