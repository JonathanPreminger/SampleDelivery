# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Artist.destroy_all
5.times do |i|
  Artist.create(
    name: Faker::Music::RockBand.name,
  )
  puts "one more artist created #{i + 1}"
end
Realrelease.destroy_all
45.times do |i|
  Realrelease.create(
    year: rand(1900..2019),
    name: Faker::Music.album,
    artist_id: rand(Artist.first.id..Artist.last.id),
  )
  puts "one more release created #{i + 1}"
end
Track.destroy_all
145.times do |i|
  Track.create(
    name: Faker::String.random(length: 4),
    duration: rand(0.00..9.40),
    realrelease_id: rand(Realrelease.first.id..Realrelease.last.id)
  )
  puts "one more track created #{i + 1}"
end
Djset.destroy_all
45.times do
  Djset.create(
    artist_id: rand(Artist.first.id..Artist.last.id),
    club: Faker::Music.album,
    start: Faker::Date.between(from: 1000.days.ago, to: Date.today)
  )
end
Article.destroy_all
Article.create(title:"Sample Delivery", content:"Sample Delivery est un collectif artistique et label de musique depuis 2016, elle compte dans ses membres fondateur Anton Hasendonck, Jessy Merciris, Medhy Kad, Theo Bivoul, Mael Lebriand et Jonathan Mete. ")
