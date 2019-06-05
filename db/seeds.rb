# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
Vote.destroy_all
FixpointAttachment.destroy_all
Fixpoint.destroy_all
User.destroy_all



User.destroy_all
Fixpoint.destroy_all
FixpointAttachment.destroy_all


puts 'Creating fake users...'

fermin = User.new(
  name: 'Fermni' ,
  email: 'fermni@gmail.com',
  password: "123456",
  admin: true
)
fermin.save!

10.times do
  user = User.new(
    name: Faker::Name.name ,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end
puts "finished creating fake users"

puts "Creating fake fixpoints"
fixpoint1 = Fixpoint.new(latitude: 38.71186305, longitude: -9.13277523, user: User.all.sample, category: 0)
fixpoint1.save!
fixpoint2 = Fixpoint.new(latitude: 38.7193042, longitude: -9.14054811, user: User.all.sample, category: 0)
fixpoint2.save!
fixpoint3 = Fixpoint.new(latitude: 38.71337819, longitude: -9.12580578, user: User.all.sample, category: 0)
fixpoint3.save!
fixpoint4 = Fixpoint.new(latitude: 38.71084859, longitude: -9.13569299, user: User.all.sample, category: 1)
fixpoint4.save!
fixpoint5 = Fixpoint.new(latitude: 38.7135469, longitude: -9.1367033, user: User.all.sample, category: 1)
fixpoint5.save!
fixpoint6 = Fixpoint.new(latitude: 38.71613696, longitude: -9.13561776, user: User.all.sample, category: 1)
fixpoint6.save!
fixpoint7 = Fixpoint.new(latitude: 38.71183255, longitude: -9.13787767, user: User.all.sample, category: 2)
fixpoint7.save!
fixpoint8 = Fixpoint.new(latitude: 38.71324097, longitude: -9.14390172, user: User.all.sample, category: 2)
fixpoint8.save!
fixpoint9 = Fixpoint.new(latitude: 38.72148564, longitude: -9.13287789, user: User.all.sample, category: 3)
fixpoint9.save!
fixpoint10 = Fixpoint.new(latitude: 38.70930381, longitude: -9.13917608, user: User.all.sample, category: 3)
fixpoint10.save!

fixpoint11 = Fixpoint.new(latitude: 34.0835063, longitude: -118.3099882, user: User.all.sample, category: 3, fixed: true)
fixpoint11.save!

puts "finishing creating fake locations"

puts "creating fake photos"
photo1 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/garbage1.jpg"), fixpoint: fixpoint1)
photo1.save!
photo2 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/garbage2.jpg"), fixpoint: fixpoint2)
photo2.save!
photo3 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/graffiti1.jpg"), fixpoint: fixpoint3)
photo3.save!
photo4 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/graffiti2.jpg"), fixpoint: fixpoint4)
photo4.save!
photo5 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/road1.jpg"), fixpoint: fixpoint5)
photo5.save!
photo6 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/road2.jpg"), fixpoint: fixpoint6)
photo6.save!
photo7 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/wall1.jpg"), fixpoint: fixpoint7)
photo7.save!
photo8 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/wall2.jpg"), fixpoint: fixpoint8)
photo8.save!
photo9 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/wires1.jpg"), fixpoint: fixpoint9)
photo9.save!
photo10 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/wires2.jpg"), fixpoint: fixpoint10)
photo10.save!

photo11 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/gianthole.jpg"), fixpoint: fixpoint11)
photo11.save!
photo12 = FixpointAttachment.new(photo: File.open("app/assets/images/photos/giantholefix.jpeg"), fixpoint: fixpoint11)
photo12.save!
puts "finishing creating fake photos"

# puts "creating fake "
