# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
puts 'Creating fake users...'

10.times do
  user = User.new(
    name: Faker::Name.name ,
    email: Faker::Internet.email,
    password: "123456"
    )
  user.save!
end
puts "finished creating users"

# puts "creating fake "

