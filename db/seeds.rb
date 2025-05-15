# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts 'Cleaning DB ... '
Owner.destroy_all
Car.destroy_all
# Favorite.destroy_all
Review.destroy_all

puts 'Creating 3 car owners'

3.times do |i|
  owner = Owner.create!(
    nickname: Faker::Internet.unique.username[1..10]
  )

  puts "#{i +1}-#{owner.nickname}"

  car = Car.create!(
    brand: Faker::Vehicle.manufacturer,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    fuel: Faker::Vehicle.fuel_type,
    owner: owner
  )

    puts "#{car.brand}"

  # rand(1..3).times do
    Review.create!(
      rating: rand(0..5.0).round(1),
      # comment: Faker::Quote.famous_last_words,
      car: car
    )
    puts "#{review.rating}"
end

puts "#{Owner.count} owners"
puts "#{Car.count} cars"
puts "#{Review.count} reviews"
