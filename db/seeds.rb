# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(role: 0, name: 'Henry', age: '11', email: 'user1@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 0, name: 'Sofia', age: '8', email: 'user2@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 1, name: 'Menninkäinen', age: '793', email: 'user3@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 1, name: 'Älva', age: '532', email: 'user4@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 2, name: 'Dead Moroz', age: '4571', email: 'user0@mail.com',
             password: '123456', password_confirmation: '123456')
