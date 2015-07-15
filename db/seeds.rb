# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Projects

15.times do
  Project.create!(
    name: Faker::Lorem.sentence
    )
end

projects = Project.all


puts "Seed finished"
puts "#{Project.count} projects created"