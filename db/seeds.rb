# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
puts 'Creating fake users...'

fermin = User.new(
  name: 'Fermni' ,
  email: 'fermni@gmail.com',
  password: "123456"
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
puts "finishing creating fake locations"

puts "creating fake photos"
photo1 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo1.save!
photo2 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo2.save!
photo3 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo3.save!
photo4 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo4.save!
photo5 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo5.save!
photo6 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo6.save!
photo7 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo7.save!
photo8 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo8.save!
photo9 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo9.save!
photo10 = Photo.new(photo: "photos/garbage1.jpeg", fixpoint: Fixpoint.all.sample)
photo10.save!
puts "finishing creating fake photos"

# puts "creating fake "
