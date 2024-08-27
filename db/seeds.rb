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
  "https://res.cloudinary.com/datqpbimu/image/upload/v1724734336/development/nmmwfbzt11jxwzcyo67y5kpa0ndo.png",
]


12.times do |i|
  user = User.create!(email: "user#{i+1}@hotmail.com", password: "123456" )

  photo_url = photo_urls.sample

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
    photo: ActiveStorage::Blob.create_and_upload!(io: URI.open(photo_url), filename: "animal_photo_#{i+1}.jpg", content_type: 'image/jpeg')
  )
end
