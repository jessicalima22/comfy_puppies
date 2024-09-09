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

photo_urls = [
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729760/lirombr_photo_of_a_white_dog_with_a_blackspot_on_the_right_eye__241a07b9-3741-4654-a075-93c7a517766b_ykacjz.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729759/lirombr_photo_of_a_dog_rolling_in_the_grass_looking_at_the_view_9b9e96c5-5b4a-48a0-bcea-c88b2505c6c5_ejiash.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729759/lirombr_photo_of_a_white_dog_with_a_blackspot_on_the_right_eye__7b1f65e2-9b10-41c5-a80c-207c25432a22_afx40r.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729730/cat4_gswvnm.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729729/cat2_wzzgxu.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724738570/regina_nbdjfi.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724738561/carlos_ktvpsw.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724738560/salem_yf2az0.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724738560/tuti_r578mb.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729729/cat_rir9zg.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724729730/cat3_emoyue.png",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724789047/Frederico_czjlos.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724789081/Penelope_ormn2y.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724789080/Lion_xaoi5m.jpg",
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724789480/sophie_w2pkkq.jpg"
]


puts "Photos loaded, wait for animals creation...."

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

puts "animal personalizado created!"

12.times do |i|
  user = User.create!(email: "user#{i+1}@hotmail.com", password: "123456" )

  Animal.create!(
  user: user,
  name: Faker::Creature::Dog.name,
  breed: Faker::Creature::Dog.breed,
  age: Faker::Creature::Dog.age,
  gender: Faker::Creature::Dog.gender,
  size: Faker::Creature::Dog.size,
  castrated: rand(1..10).odd?,
  vaccinated: [true, false].sample,
  dewormed: [true, false].sample,
  special_needed: [true, false].sample,
  location: Faker::Address.city, # You can use city, state, or country based on your needs
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/datqpbimu/image/upload/v1724789480/sophie_w2pkkq.jpg"),
      filename: "photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/datqpbimu/image/upload/v1724789080/Lion_xaoi5m.jpg"),
      filename: "photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/datqpbimu/image/upload/v1724729730/cat3_emoyue.png"),
      filename: "photo3.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open( "https://res.cloudinary.com/datqpbimu/image/upload/v1724738560/tuti_r578mb.jpg"),
      filename: "photo4.jpg",
      content_type: 'image/jpeg'
    )
  ]
  )
  puts "#{1+i} created!"
end





puts "Animals created!"
