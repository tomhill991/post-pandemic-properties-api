# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"
require 'date'

Review.destroy_all
Booking.destroy_all
Property.destroy_all
User.destroy_all

boolean = [true, false]
addresses = ['47 Main Road, London', '138 Kingsland Road, London', '30 Cavendish Avenue, Essex', '85 Chelmsford Road, London']

puts 'Creating 3 fake users....'

user1 = User.create!(
    :email  => 'tom.hill991@gmail.com',
    :password  => "fakepassword",
    :password_confirmation => "fakepassword"
)

user2 = User.create!(
    :email  => 'hill_20_20@hotmail.com',
    :password  => "fakepassword",
    :password_confirmation => "fakepassword"
)

user3 = User.create!(
    :email  => 'tom@mediasia-interactive.com',
    :password  => "fakepassword",
    :password_confirmation => "fakepassword"
)

property1 = Property.create!(
    :max_guests  => 5,
    :price_per_day => rand(500...10000),
    :address  => addresses.sample,
    :title  => Faker::Company.bs,
    :description  => Faker::Lorem.paragraph(sentence_count: 3),
    :has_beach_nearby  => boolean.sample,
    :has_beds  => boolean.sample,
    :has_kitchen  => boolean.sample,
    :has_swimming_pool  => boolean.sample,
    :has_hdtv  => boolean.sample,
    :has_bathtub  => boolean.sample,
    :user_id => user1.id
)

property2 = Property.create!(
    :max_guests  => 7,
    :price_per_day => rand(500...10000),
    :address  => addresses.sample,
    :title  => Faker::Company.bs,
    :description  => Faker::Lorem.paragraph(sentence_count: 3),
    :has_beach_nearby  => boolean.sample,
    :has_beds  => boolean.sample,
    :has_kitchen  => boolean.sample,
    :has_swimming_pool  => boolean.sample,
    :has_hdtv  => boolean.sample,
    :has_bathtub  => boolean.sample,
    :user_id => user2.id
)

property3 = Property.create!(
    :max_guests  => 3,
    :price_per_day => rand(500...10000),
    :address  => addresses.sample,
    :title  => Faker::Company.bs,
    :description  => Faker::Lorem.paragraph(sentence_count: 3),
    :has_beach_nearby  => boolean.sample,
    :has_beds  => boolean.sample,
    :has_kitchen  => boolean.sample,
    :has_swimming_pool  => boolean.sample,
    :has_hdtv  => boolean.sample,
    :has_bathtub  => boolean.sample,
    :user_id => user3.id
)

puts 'Creating 6 fake bookings....'
Booking.create!(
    :date_start => DateTime.new(2021,8,6),
    :date_end => DateTime.new(2021,8,12),
    :property_id => property1.id,
    :user_id => user2.id,
    :no_of_guests => 4
)

Booking.create!(
    :date_start => DateTime.new(2021,8,6),
    :date_end => DateTime.new(2021,8,12),
    :property_id => property2.id,
    :user_id => user1.id,
    :no_of_guests => 6
)

Booking.create!(
    :date_start => DateTime.new(2021,8,6),
    :date_end => DateTime.new(2021,8,12),
    :property_id => property3.id,
    :user_id => user3.id,
    :no_of_guests => 2
)

booking4 = Booking.create!(
    :date_start => DateTime.new(2021,5,6),
    :date_end => DateTime.new(2021,5,12),
    :property_id => property1.id,
    :user_id => user1.id,
    :no_of_guests => 4
)

booking5 = Booking.create!(
    :date_start => DateTime.new(2021,3,6),
    :date_end => DateTime.new(2021,3,12),
    :property_id => property2.id,
    :user_id => user2.id,
    :no_of_guests => 6
)

booking6 = Booking.create!(
    :date_start => DateTime.new(2021,1,6),
    :date_end => DateTime.new(2021,1,12),
    :property_id => property3.id,
    :user_id => user3.id,
    :no_of_guests => 2
)

puts 'Creating 3 fake reviews....'
Review.create!(
    :description => "The house was nice. Could have had a bigger pool. If only there was a maid to clean it would have been perfect!",
    :rating => 4,
    :booking_id => booking4.id
)

Review.create!(
    :description => "This was absolutely the worst place I have ever stayed in. Cockroaches woke us up every night. I think there were two factions of them going to war. They would hiss and in the morning we would wake up to dead cockroaches wearing red or blue.",
    :rating => 1,
    :booking_id => booking5.id
)

Review.create!(
    :description => "Absolutely gorgeous villa. I am so happy that my sugar bubbah booked this place. Couldn't recommend it highly enough - if I could choose 10 stars it would get 50!",
    :rating => 5,
    :booking_id => booking6.id
)

puts 'Adding images to each property....'
file1 = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577198376/IMG_0487_dzprsi.jpg')
file2 = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577198419/Vila_Sol_apartment_lugvvp.jpg')
file3 = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577198343/IMG_0484_oqf3w5.jpg')
file4 = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577188398/IMG_0496_pig5jw.gif')
file5 = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577187441/IMG_0492_xyee2r.jpg')

property1.images.attach(io: file1, filename: 'IMG_0487_dzprsi.jpg', content_type: 'image/jpg')
property1.images.attach(io: file2, filename: 'Vila_Sol_apartment_lugvvp.jpg', content_type: 'image/jpg')
property1.images.attach(io: file3, filename: 'IMG_0484_oqf3w5.jpg', content_type: 'image/jpg')
property1.images.attach(io: file4, filename: 'IMG_0496_pig5jw.gif', content_type: 'image/gif')
property1.images.attach(io: file5, filename: 'IMG_0492_xyee2r.jpg', content_type: 'image/jpg')


# property2.images.attach(io: file1, filename: 'IMG_0487_dzprsi.jpg', content_type: 'image/jpg')
# property2.images.attach(io: file2, filename: 'Vila_Sol_apartment_lugvvp.jpg', content_type: 'image/jpg')
# property2.images.attach(io: file3, filename: 'IMG_0484_oqf3w5.jpg', content_type: 'image/jpg')
# property2.images.attach(io: file4, filename: 'IMG_0496_pig5jw.gif', content_type: 'image/gif')
# property2.images.attach(io: file5, filename: 'IMG_0492_xyee2r.jpg', content_type: 'image/jpg')

# property3.images.attach(io: file1, filename: 'IMG_0487_dzprsi.jpg', content_type: 'image/jpg')
# property3.images.attach(io: file2, filename: 'Vila_Sol_apartment_lugvvp.jpg', content_type: 'image/jpg')
# property3.images.attach(io: file3, filename: 'IMG_0484_oqf3w5.jpg', content_type: 'image/jpg')
# property3.images.attach(io: file4, filename: 'IMG_0496_pig5jw.gif', content_type: 'image/gif')
# property3.images.attach(io: file5, filename: 'IMG_0492_xyee2r.jpg', content_type: 'image/jpg')

puts 'Finished!'