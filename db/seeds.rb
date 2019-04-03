# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')

# User.create(first_name: "diamond", last_name: "business", email: "business@gmail.com", password: "TEST123")

10.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "TEST123")
end

User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "TEST123")

10.times do 
  Event.create(start_date: Faker::Date.forward(20), duration: 30, title: "eeewewewew#{Faker::Book.title}", description:"gsjjejde#{Faker::ChuckNorris.fact}", price:100, location: Faker::Address.city, admin:User.all.sample)
  # Event.create(start_date:12/12/2019, duration:20, title:"gros cava", description:"bien ou quoi bla bla bla", price:10, location:"paname", admin:User.find(1))

  puts "Event"
end
Event.create(start_date: Faker::Date.forward(20), duration: 30, title: Faker::Book.title, description: Faker::ChuckNorris.fact, price: rand(1..900), location: Faker::Address.city)


20.times do 
  Attendance.create(stripe_customer_id:"azerty", guest:User.all.sample, event: Event.all.sample)
end