# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |i|
  Product.create(
    name:        Faker::App.name,
    description: Faker::Hipster.sentence,
    image_url:   Faker::Avatar.image(SecureRandom.hex, '400x400'),
    price:       Faker::Commerce.price
  )
  puts "Created #{i}"
end
