# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!( role: 0, name: 'Henry', age: '11')
User.create!( role: 0, name: 'Sofia', age: '8')
User.create!( role: 1, name: 'Menninkäinen', age: '793')
User.create!( role: 1, name: 'Älva', age: '532')
User.create!( role: 2, name: 'Dead Moroz', age: '4571')
