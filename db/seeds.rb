# require 'faker'
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

# photo_urls = [
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729760/lirombr_photo_of_a_white_dog_with_a_blackspot_on_the_right_eye__241a07b9-3741-4654-a075-93c7a517766b_ykacjz.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729759/lirombr_photo_of_a_dog_rolling_in_the_grass_looking_at_the_view_9b9e96c5-5b4a-48a0-bcea-c88b2505c6c5_ejiash.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729759/lirombr_photo_of_a_white_dog_with_a_blackspot_on_the_right_eye__7b1f65e2-9b10-41c5-a80c-207c25432a22_afx40r.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729730/cat4_gswvnm.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729729/cat2_wzzgxu.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724738570/regina_nbdjfi.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724738561/carlos_ktvpsw.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724738560/salem_yf2az0.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724738560/tuti_r578mb.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729729/cat_rir9zg.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724729730/cat3_emoyue.png",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724789047/Frederico_czjlos.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724789081/Penelope_ormn2y.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724789080/Lion_xaoi5m.jpg",
#   "https://res.cloudinary.com/datqpbimu/image/upload/v1724789480/sophie_w2pkkq.jpg"
# ]

puts "Photos loaded, wait for animals creation...."

12.times do |i|
  user = User.create!(email: "user#{i+1}@hotmail.com", password: "123456" )

  # photo_url = photo_urls.pop
  @animals = [
    {
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
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725718064/laura-chica-yUm0_Vp3T_E-unsplash_drrp5r.jpg", filename: "buddy_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725718063/laura-chica-fT1IJ04JwvU-unsplash_mlpo0u.jpg", filename: "buddy_photo2.jpg" }
      ]
    },
    {
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
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717697/nando-martins-XoNEVo4GUUA-unsplash_oiojzm.jpg", filename: "bella_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717696/nando-martins-RP50aO9I2NI-unsplash_tjddur.jpg", filename: "bella_photo2.jpg" }
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717695/nando-martins-MZJq593VV_g-unsplash_pbwjto.jpg", filename: "bella_photo2.jpg" }

      ]
    },
    {
      name: "Max",
      breed: "German Shepherd",
      age: "4 years",
      gender: "Male",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Chicago",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717694/madalyn-cox-S3Fe1zuE8u0-unsplash_onye5d.jpg", filename: "max_photo1.jpg" },
      ]
    },
    {
      name: "Lucy",
      breed: "Pug",
      age: "6 years",
      gender: "Female",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: true,
      location: "San Francisco",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717692/matthew-henry-U5rMrSI7Pn4-unsplash_g8pekw.jpg", filename: "lucy_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717691/matthew-henry-2Ts5HnA67k8-unsplash_yginxk.jpg", filename: "lucy_photo2.jpg" }
      ]
    },
    {
      name: "Charlie",
      breed: "Golden Retriever",
      age: "2 years",
      gender: "Male",
      size: "Medium",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Houston",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717690/massimo-negrello-D6LVniHET4Q-unsplash_qmzt6q.jpg", filename: "charlie_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717689/massimo-negrello-Cgup_bHsr_w-unsplash_uukzp2.jpg", filename: "charlie_photo2.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717689/massimo-negrello-cLZQ9KHuTos-unsplash_vs8uqg.jpg", filename: "charlie_photo2.jpg" }
      ]
    },
    {
      name: "Daisy",
      breed: "Poodle",
      age: "1 year",
      gender: "Female",
      size: "Small",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Phoenix",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717686/janosch-diggelmann-9RMOwSY4jFw-unsplash_wwvhsk.jpg", filename: "daisy_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717679/janosch-diggelmann-HlOLcjp4AEM-unsplash_v7jqjf.jpg", filename: "daisy_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717678/janosch-diggelmann-nvoJ-du8w5o-unsplash_jqwtzd.jpg", filename: "daisy_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717671/janosch-diggelmann-4RgsZN_muEk-unsplash_xgm1mv.jpg", filename: "daisy_photo1.jpg" }
      ]
    },
    {
      name: "Rocky",
      breed: "Rottweiler",
      age: "8 years",
      gender: "Male",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Philadelphia",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717688/madalyn-cox-eAFQVWJ0YIc-unsplash_nz3yhz.jpg", filename: "rocky_photo1.jpg" },
      ]
    },
    {
      name: "Luna",
      breed: "Shih Tzu",
      age: "2 years",
      gender: "Female",
      size: "Small",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "San Antonio",
      photos: [
        { url: "https://example.com/photo15.jpg", filename: "luna_photo1.jpg" },
        { url: "https://example.com/photo16.jpg", filename: "luna_photo2.jpg" }
      ]
    },
    {
      name: "Jack",
      breed: "Boxer",
      age: "4 years",
      gender: "Male",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: true,
      location: "Dallas",
      photos: [
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-sCe7tMl39UY-unsplash_glrzbh.jpg", filename: "jack_photo1.jpg" },
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-eKXrAq2UUGI-unsplash_jtbvmq.jpg", filename: "jack_photo2.jpg" }
        { url: "https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-jhS0r78MBtc-unsplash_zk4g3n.jpg", filename: "jack_photo2.jpg" }
      ]
    },
    {
      name: "Molly",
      breed: "Cocker Spaniel",
      age: "3 years",
      gender: "Female",
      size: "Medium",
      castrated: false,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "San Diego",
      photos: [
        { url: "https://example.com/photo19.jpg", filename: "molly_photo1.jpg" },
        { url: "https://example.com/photo20.jpg", filename: "molly_photo2.jpg" }
      ]
    },
    {
      name: "Zeus",
      breed: "Great Dane",
      age: "6 years",
      gender: "Male",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Austin",
      photos: [
        { url: "https://example.com/photo21.jpg", filename: "zeus_photo1.jpg" },
        { url: "https://example.com/photo22.jpg", filename: "zeus_photo2.jpg" }
      ]
    },
    {
      name: "Roxy",
      breed: "Dachshund",
      age: "2 years",
      gender: "Female",
      size: "Small",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Seattle",
      photos: [
        { url: "https://example.com/photo23.jpg", filename: "roxy_photo1.jpg" },
        { url: "https://example.com/photo24.jpg", filename: "roxy_photo2.jpg" }
      ]
    },
    {
      name: "Buster",
      breed: "Border Collie",
      age: "3 years",
      gender: "Male",
      size: "Medium",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Denver",
      photos: [
        { url: "https://example.com/photo25.jpg", filename: "buster_photo1.jpg" },
        { url: "https://example.com/photo26.jpg", filename: "buster_photo2.jpg" }
      ]
    },
    {
      name: "Maggie",
      breed: "French Bulldog",
      age: "2 years",
      gender: "Female",
      size: "Small",
      castrated: false,
      vaccinated: true,
      dewormed: true,
      special_needed: false,
      location: "Portland",
      photos: [
        { url: "https://example.com/photo27.jpg", filename: "maggie_photo1.jpg" },
        { url: "https://example.com/photo28.jpg", filename: "maggie_photo2.jpg" }
      ]
    },
    {
      name: "Shadow",
      breed: "Husky",
      age: "4 years",
      gender: "Male",
      size: "Large",
      castrated: true,
      vaccinated: true,
      dewormed: true,
      special_needed: true,
      location: "Miami",
      photos: [
        { url: "https://example.com/photo29.jpg", filename: "shadow_photo1.jpg" },
        { url: "https://example.com/photo30.jpg", filename: "shadow_photo2.jpg" }
      ]
    },
    {
      name: "Coco",
      breed: "Chihuahua",
      age: "5 years",
      gender: "Female"
    }
  ]

puts "Animals created!"
