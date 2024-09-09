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
puts "Creating users..."

12.times do |i|
  user = User.create!(email: "user#{i+1}@hotmail.com", password: "123456" )
end

puts "users created, wait for animals creation...."

user = User.create!(email: "monika@gmail.com", password: "123456" )

Animal.create!(
  user: user,
  name: "Buddy",
  breed: "Labrador",
  age: "5 years",
  gender: "Male",
  size: "Large",
  castrated: true,
  vaccinated: true,
  dewormed: true,
  special_needed: false,
  location: "New York",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725718064/laura-chica-yUm0_Vp3T_E-unsplash_drrp5r.jpg"),
      filename: "buddy_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725718063/laura-chica-fT1IJ04JwvU-unsplash_mlpo0u.jpg"),
      filename: "buddy_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

Animal.create!(
  user: user,
  name: "Bella",
  breed: "Beagle",
  age: "3 years",
  gender: "Female",
  size: "Medium",
  castrated: false,
  vaccinated: true,
  dewormed: true,
  special_needed: true,
  location: "Los Angeles",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717697/nando-martins-XoNEVo4GUUA-unsplash_oiojzm.jpg"),
      filename: "bella_photo1.jpg",
      content_type: 'image/jpeg',
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717696/nando-martins-RP50aO9I2NI-unsplash_tjddur.jpg"),
      filename: "bella_photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717695/nando-martins-MZJq593VV_g-unsplash_pbwjto.jpg"),
      filename: "bella_photo3.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "5 animals created..."





puts "Animals created!"
