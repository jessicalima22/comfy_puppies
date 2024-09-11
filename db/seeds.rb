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



user1 = User.create!(email: "monika@gmail.com", password: "123456" )
user2 = User.create!(email: "lucas@gmail.com", password: "123456" )
user3 = User.create!(email: "kuxi@gmail.com", password: "123456" )
user4 = User.create!(email: "maria@gmail.com", password: "123456" )
user5 = User.create!(email: "john@gmail.com", password: "123456" )
user6 = User.create!(email: "susan@gmail.com", password: "123456" )
user7 = User.create!(email: "mike@gmail.com", password: "123456" )

puts "users created, wait for 14 animals creation...."

users = User.all.to_a

Animal.create!(
  user: users.sample,
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

puts "1 - Buddy created..."

Animal.create!(
  user: users.sample,
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

puts "2 - Bella created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717694/madalyn-cox-S3Fe1zuE8u0-unsplash_onye5d.jpg"),
      filename: "max_photo1.jpg",
      content_type: 'image/jpeg',
    ),
  ]
)

puts "3 - Max created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717692/matthew-henry-U5rMrSI7Pn4-unsplash_g8pekw.jpg"),
      filename: "lucy_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717691/matthew-henry-2Ts5HnA67k8-unsplash_yginxk.jpg"),
      filename: "lucy_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "4 - Lucy created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717690/massimo-negrello-D6LVniHET4Q-unsplash_qmzt6q.jpg"),
      filename: "charlie_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717689/massimo-negrello-Cgup_bHsr_w-unsplash_uukzp2.jpg"),
      filename: "charlie_photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717689/massimo-negrello-cLZQ9KHuTos-unsplash_vs8uqg.jpg"),
      filename: "charlie_photo3.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "5 - Charlie created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717686/janosch-diggelmann-9RMOwSY4jFw-unsplash_wwvhsk.jpg"),
      filename: "daisy_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717679/janosch-diggelmann-HlOLcjp4AEM-unsplash_v7jqjf.jpg"),
      filename: "daisy_photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717678/janosch-diggelmann-nvoJ-du8w5o-unsplash_jqwtzd.jpg"),
      filename: "daisy_photo3.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717671/janosch-diggelmann-4RgsZN_muEk-unsplash_xgm1mv.jpg"),
      filename: "daisy_photo4.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "6 - Daisy created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717688/madalyn-cox-eAFQVWJ0YIc-unsplash_nz3yhz.jpg"),
      filename: "rocky_photo1.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "7 - Rocky created..."

Animal.create!(
  user: users.sample,
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
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-sCe7tMl39UY-unsplash_glrzbh.jpg"),
      filename: "jack_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-eKXrAq2UUGI-unsplash_jtbvmq.jpg"),
      filename: "jack_photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717670/jade-gray-jhS0r78MBtc-unsplash_zk4g3n.jpg"),
      filename: "jack_photo3.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "8 - Jack created..."

Animal.create!(
  user: users.sample,
  name: "Whiskers",
  breed: "Persian Cat",
  age: "2 years",
  gender: "Male",
  size: "Small",
  castrated: true,
  vaccinated: true,
  dewormed: true,
  special_needed: false,
  location: "Boston",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717680/jeanie-de-klerk-t_Z5ND4Ce3k-unsplash_smei9k.jpg"),
      filename: "whiskers_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717679/jeanie-de-klerk-bhonzdJMVjY-unsplash_o5sqee.jpg"),
      filename: "whiskers_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "9 - Whiskers created..."

Animal.create!(
  user: users.sample,
  name: "Fluffy",
  breed: "Chinchilla",
  age: "1 year",
  gender: "Female",
  size: "Small",
  castrated: false,
  vaccinated: false,
  dewormed: false,
  special_needed: false,
  location: "San Francisco",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717699/pete-f-xtaeK_kHTNo-unsplash_df1nbb.jpg"),
      filename: "fluffy_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717698/pete-f-GpLEzl4OthA-unsplash_xzc2tv.jpg"),
      filename: "fluffy_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "10 - Fluffy created..."

Animal.create!(
  user: users.sample,
  name: "Furball",
  breed: "Hamster",
  age: "6 months",
  gender: "Female",
  size: "Small",
  castrated: false,
  vaccinated: false,
  dewormed: false,
  special_needed: false,
  location: "Seattle",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717694/nikolett-emmert-E7efLhhdpYI-unsplash_vtbujb.jpg"),
      filename: "furball_photo1.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "11 - Furball created..."

Animal.create!(
  user: users.sample,
  name: "Tom",
  breed: "Siamese Cat",
  age: "1 year",
  gender: "Male",
  size: "Small",
  castrated: true,
  vaccinated: true,
  dewormed: true,
  special_needed: "requires insulin shots for diabetes",
  location: "Chicago",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717678/christian-panta-mFx9nu-jToY-unsplash_dt4gzv.jpg"),
      filename: "tom_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717689/christian-panta-DWwfkxCYg6s-unsplash_xg339y.jpg"),
      filename: "tom_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "12 - Tom created..."

Animal.create!(
  user: users.sample,
  name: "Ginger",
  breed: "Maine Coon",
  age: "2 years",
  gender: "Female",
  size: "Large",
  castrated: true,
  vaccinated: true,
  dewormed: true,
  special_needed: false,
  location: "Portland",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717703/vlad-ion-XdrO9mK-8Bo-unsplash_yph4mj.jpg"),
      filename: "ginger_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717703/vlad-ion-gYPBvkcL-wY-unsplash_cxecww.jpg"),
      filename: "ginger_photo2.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717702/vlad-ion-CHnpJntiJZc-unsplash_fphcbv.jpg"),
      filename: "ginger_photo3.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "13 - Ginger created..."

Animal.create!(
  user: users.sample,
  name: "Oscar",
  breed: "Tabby Cat",
  age: "5 years",
  gender: "Male",
  size: "Medium",
  castrated: true,
  vaccinated: true,
  dewormed: true,
  special_needed: "needs kidney care diet",
  location: "Denver",
  photos: [
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717702/shelby-pieper-ceqSMneojZY-unsplash_x5eruq.jpg"),
      filename: "oscar_photo1.jpg",
      content_type: 'image/jpeg'
    ),
    ActiveStorage::Blob.create_and_upload!(
      io: URI.open("https://res.cloudinary.com/dsoletyk5/image/upload/v1725717701/shelby-pieper-zSm16qTUeSc-unsplash_wvruk3.jpg"),
      filename: "oscar_photo2.jpg",
      content_type: 'image/jpeg'
    )
  ]
)

puts "14 - Oscar created..."

puts "Animals created!"
