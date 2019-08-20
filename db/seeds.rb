require 'faker'

puts 'Deleting all database content...'

User.destroy_all
Feature.destroy_all


puts 'Creating master user...'

master_user = User.new(first_name: 'Federico', last_name: 'Pooface', email: 'master@user.com', password: 'master', password_confirmation: 'master')
master_user.save
puts 'email: master@user.com'
puts 'password: master'

puts 'Creating a bunch of garages'

garage_images = [
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230623/safemybike/14_grdt5w.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230618/safemybike/7_g7lyep.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230621/safemybike/10_ox5wng.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230621/safemybike/9_dqxagh.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230616/safemybike/6_zqepo2.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230780/safemybike/garage_0_xl4wwn.jpg',
  'https://res.cloudinary.com/di1eyazrv/image/upload/v1566230821/safemybike/garage-bouwen-bijgebouw-1_xjevq0.jpg',
  'https://www.bronafon.org.uk/wp-content/uploads/2018/03/Garage.jpg',
]

addresses = [
  {street_number: '100', street_address: 'Horzelstraat', city: 'Brussel', country: 'Belgium'},
  {street_number: '950', street_address: 'Waversesteenweg', city: 'Etterbeek', country: 'Belgium'},
  {street_number: '9', street_address: 'Idaliestraat', city: 'Elsene', country: 'Belgium'},
  {street_number: '1', street_address: 'Vandenbrandenstraat', city: 'Brussel', country: 'Belgium'},
  {street_number: '1', street_address: 'Croydonlaan', city: 'Brussel', country: 'Belgium'},
  {street_number: '345', street_address: 'Keizer Karellaan', city: 'Ganshoren', country: 'Belgium'},
  {street_number: '23', street_address: 'Brabançonnelaan', city: 'Brussel', country: 'Belgium'},
  {street_number: '31', street_address: 'Verheydenstraat', city: 'Anderlecht', country: 'Belgium'}
]

description = 'A residential garage is a walled, roofed structure for storing a vehicle or vehicles that may be part of or attached to a home ("attached garage"), or a separate outbuilding or shed ("detached garage"). Residential garages typically have space for one or two cars, although three-car garages are used. When a garage is attached to a house, the garage typically has an entry door into the house. Garages normally have a wide door which can be raised to permit the entry and exit of a vehicle, and then closed to secure the vehicle. A garage protects a vehicle from precipitation, and, if it is equipped with a locking garage door, it also protects the vehicle(s) from theft and vandalism. Garages are also used for a variety of projects including painting, woodworking and assembling of projects.'

i = 0
8.times do
  garage = Garage.new(
    name: Faker::Name.first_name,
    description: description,
    street_number: addresses[i][:street_number],
    street_address: addresses[i][:street_address],
    city: addresses[i][:city],
    country: addresses[i][:country],
    capacity_reg_bikes: rand(1..6),
    capacity_large_bikes: rand(1..2)
  )
  garage.user = master_user
  garage.remote_profile_image_url = garage_images[i]
  garage.save!
  i += 1
end

puts 'Success! Database seeded!'

garage = Garage.new(
    name: "test",
    description: "test description",
    street_number: "test number",
    street_address: "test address",
    city: "test city",
    country: "test country",
    capacity_reg_bikes: rand(1..6),
    capacity_large_bikes: rand(1..2)
  )
