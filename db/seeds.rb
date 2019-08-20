require 'faker'

puts 'Deleting all database content...'

User.destroy_all
FeaturePresence.destroy_all
Feature.destroy_all

puts '-'*40

puts 'Creating master user...'

master_user = User.new(first_name: 'Federico', last_name: 'Pooface', email: 'master@user.com', password: 'master', password_confirmation: 'master')
master_user.save
puts 'email: master@user.com'
puts 'password: master'

puts '-'*40

puts 'Creating owner user...'

owner_user = User.new(first_name: 'Franky', last_name: 'Doodoo', email: 'owner@user.com', password: 'master', password_confirmation: 'master')
owner_user.save

puts 'email: owner@user.com'
puts 'password: master'

puts '-'*40

puts 'Creating renter user...'

renter_user = User.new(first_name: 'Eddy', last_name: 'King', email: 'renter@user.com', password: 'master', password_confirmation: 'master')
renter_user.save
puts 'email: renter@user.com'
puts 'password: master'

puts '-'*40

puts 'The master user goes out and buys a series of expensive bikes...'

bike_names = %w(EddyMerckx-bike Cowboy Cowgirl Tandem HippyBike OldAndUgly)

i = 0
6.times do
  bike = Bike.new(
    name: bike_names[i],
    bike_size: ['regular', 'cargo'].sample,
    bike_type: ['electric', 'non-electric'].sample
    )
  bike.user = master_user
  bike.save!
  i += 1
end

puts 'The renter user goes out and buys a cool electric bike and a huge cargo bike...'

bike = Bike.new(name: 'E-Bike', bike_size: 'regular', bike_type: 'electric')
bike.user = renter_user
bike.save!
bike = Bike.new(name: 'Cargo Bike', bike_size: 'cargo', bike_type: 'non-electric')
bike.user = renter_user
bike.save!

puts 'Creating garage feature list...'

Feature.new(name: 'bicycle rack', icon_image: '<i class="fas fa-stream"></i>').save!
Feature.new(name: 'charging station', icon_image: '<i class="fas fa-charging-station"></i>').save!
Feature.new(name: 'tire pump', icon_image: '<i class="fas fa-wind"></i>').save!
Feature.new(name: 'electric tire pump', icon_image: '<i class="fas fa-bolt"></i>').save!
Feature.new(name: 'accessible through pin-code', icon_image: '<i class="fas fa-lock"></i>').save!
Feature.new(name: 'camera security', icon_image: '<i class="fas fa-video"></i>').save!


puts 'Creating a bunch of garages...'

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

features = Feature.all

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
    capacity_large_bikes: rand(1..2),
    price_regular_bike: rand(15..22),
    price_large_bike: rand(25..32)
  )
  if i < 7
    garage.user = master_user
  else
    garage.user = owner_user
  end
  garage.remote_profile_image_url = garage_images[i]
  garage.save!
  i += 1
  o = 0
  rand(2..6).times do
    feature_presence = FeaturePresence.new
    feature_presence.garage = garage
    feature_presence.feature = features[o]
    feature_presence.save!
    feature_presence
    o += 1
  end
end

puts 'Success! Database seeded!'

