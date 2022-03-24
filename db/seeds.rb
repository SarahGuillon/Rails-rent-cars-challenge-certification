require "open-uri"
require "date"
require 'faker'

puts 'Cleaning db'

Booking.destroy_all
Car.destroy_all
User.destroy_all

puts 'Creating Users'

hugo = User.create(email: 'hugo@email.com', password: 'password')
sarah = User.create(email: 'sarah@email.com', password: 'password')
christiane = User.create(email: 'christiane@email.com', password: 'password')
matthias = User.create(email: 'matthias@email.com', password: 'password')
luc = User.create(email: 'luc@email.com', password: 'password')
sophie = User.create(email: 'sophie@email.com', password: 'password')
paul = User.create(email: 'paul@email.com', password: 'password')
pierre = User.create(email: 'pierreLS96@email.com', password: 'password')
nicolas = User.create(email: 'nicolasweb@email.com', password: 'password')
anna = User.create(email: 'anna_34@email.com', password: 'password')
julie = User.create(email: 'julieRTO@email.com', password: 'password')
alix = User.create(email: 'alix98@email.com', password: 'password')

puts 'Creating Cars'

30.times do
  car = Car.new(
    brand:    Faker::Vehicle.manufacture,
    model:    Faker::Vehicle.model,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    year_of_production: rand(2000..2022),
    price_per_day: rand(30..100),
    user: [ hugo, sarah, christiane, matthias, luc, sophie, paul, pierre, nicolas, anna, julie, alix ].sample
  )
  car.save!
#   Booking.create(
#   start_date: Faker::Date.between(from: '2022-02-00', to: '2022-02-15'),
#   end_date: Faker::Date.between(from: '2022-02-16', to: '2022-03-23'),
#   accepted: true,
#   user: [ hugo, sarah, christiane, matthias, luc, sophie, paul, pierre, nicolas, anna, julie, alix ].sample
#   car: car
# )
end

puts 'Finished!'
