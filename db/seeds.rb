# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users

10.times do
  user = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10) 
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Projects

15.times do
  Project.create!(
    name: Faker::Lorem.sentence
    )
end

projects = Project.all

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"