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

Donation.destroy_all
UserAchievement.destroy_all
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
  avatar: Faker::Avatar.image,
  password: '1234567890',
  password_confirmation: '1234567890'
})


user2 = User.create!({
  first_name: Faker::Internet.user_name,
  last_name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  avatar: Faker::Avatar.image,
  password: '1234567890',
  password_confirmation: '1234567890'
})

user3 = User.create!({
  first_name: 'Riley',
  last_name: 'Gowan',
  email: 't.rileygowan@gmail.com',
  avatar: Faker::Avatar.image,
  password: '1234567890',
  password_confirmation: '1234567890'
})

user4 = User.create!({
  first_name: 'Thomas',
  last_name: 'Gowan',
  email: 'rileygowan@gmail.com',
  avatar: Faker::Avatar.image,
  password: '1234567890',
  password_confirmation: '1234567890'
})

## ACHIEVEMENTS
puts "Re-creating Achievements ..."
Achievement.destroy_all

achievement0 = Achievement.create!({
  title: 'Join Us, Join Us',
  description: 'Register on Charity Spree',
  progress: 0,
  image: '002-medal.png'
})

achievement1 = Achievement.create!({
  title: 'Bang for Your Buck',
  description: 'Donate your first dollar to a charity of your choice',
  progress: 1,
  image: '003-ribbon.png'
})

achievement2 = Achievement.create!({
  title: 'Loose Change',
  description: 'Donate your tenth dollar to a charity of your choice',
  progress: 10,
  image: '004-medal-1.png'
})
achievement3 = Achievement.create!({
  title: 'Big Spender',
  description: 'Donate one hundred dollars to a charity of your choice',
  progress: 100,
  image: '005-cup.png'
})

## user_achievements
puts "Re-creating UserAchievements ..."
user1.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement1.id)
user2.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement1.id)

user1.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement2.id)
user2.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement2.id)

user1.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement3.id)
user2.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement3.id)


## DONATIONS
puts "Re-creating Donations ..."

user1.donations.create!(quantity: 1, charity_id: charity1.id)
user1.donations.create!(quantity: 5, charity_id: charity2.id)

## USER ACHIEVEMENTS
puts "Re-creating User Achievements ..."
user3.user_achievements.create!(achievement_id: achievement1.id, achieved: true, progress: 1)
user3.user_achievements.create!(achievement_id: achievement2.id, achieved: true, progress: 1)

puts "DONE!"
