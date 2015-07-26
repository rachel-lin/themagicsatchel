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

# Create admin user

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create Projects

status = ['Ideation', 'Research', 'Prototyping', 'Completed']

15.times do
  Project.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    status: status.sample
    )
end

projects = Project.all


# Create Text Posts

15.times do
  Text.create!(
    user: users.sample,
    project: projects.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.sentence,
    source: Faker::Lorem.sentence
    )
end

texts = Text.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"
puts "#{Text.count} texts created"