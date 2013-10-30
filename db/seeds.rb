require 'faker'

rand(10..40).times do
  p = Wiki.create(title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(1..10)).join("\n"))
  end

puts "Seed finished"
puts "#{Wiki.count} wikis created"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
