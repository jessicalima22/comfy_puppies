require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning Database"
Animal.destroy_all
User.destroy_all
puts "Creating Animals"


10.times do |i|
  user = User.create!(email: "user#{i+1}@hotmail.com", password: "123456" )

  Animal.create!(
    user: user,
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    age: Faker::Creature::Dog.age,
    gender: Faker::Creature::Dog.gender,
    size: Faker::Creature::Dog.size,
    castrated: rand(1..10).odd?,
    vaccinated: [true, false].sample
  )
end
