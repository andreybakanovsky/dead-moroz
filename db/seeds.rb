# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kid = User.create!(role: 0, name: 'Henry', age: '11', email: 'user1@gmail.com',
                   password: '123456', password_confirmation: '123456')
good1 = Good.create!(
  year: 2022,
  content: 'I have helped my grandfather to remove snow in the yard this winter.',
  user_id: kid.id
)
good2 = Good.create!(
  year: 2021,
  content: "I've made postcards for the whole family.",
  user_id: kid.id
)
good3 = Good.create!(
  year: 2020,
  content: "I cared for my brother when my mom wasn't at home.",
  user_id: kid.id
)
good4 = Good.create!(
  year: 2019,
  content: 'My grandfather and I planted six trees.',
  user_id: kid.id
)
good5 = Good.create!(
  year: 2018,
  content: 'I fed animals in the zoo. .',
  user_id: kid.id
)

kid2 = User.create!(role: 0, name: 'Sofia', age: '8', email: 'user2@gmail.com',
                    password: '123456', password_confirmation: '123456')
good1 = Good.create!(
  year: 2022,
  content: 'I fed birds and squirrels in winter.',
  user_id: kid2.id
)
good2 = Good.create!(
  year: 2021,
  content: 'I helped my mom to care for flowers.',
  user_id: kid2.id
)
good3 = Good.create!(
  year: 2020,
  content: 'I read the book to my brother in the evenings.',
  user_id: kid2.id
)
good4 = Good.create!(
  year: 2019,
  content: 'My grandfather and I planted six trees.',
  user_id: kid2.id
)
good5 = Good.create!(
  year: 2018,
  content: 'I cared for the younger brother.',
  user_id: kid2.id
)
good6 = Good.create!(
  year: 2018,
  content: 'I cared for the younger brother.',
  user_id: kid2.id
)

kid3 = User.create!(role: 0, name: 'Oliver', age: '7', email: 'user3@gmail.com',
                    password: '123456', password_confirmation: '123456')

kid4 = User.create!(role: 0, name: 'Aimée', age: '13', email: 'user4@gmail.com',
                    password: '123456', password_confirmation: '123456')

kid5 = User.create!(role: 0, name: 'William', age: '8', email: 'user5@gmail.com',
                    password: '123456', password_confirmation: '123456')

kid6 = User.create!(role: 0, name: 'Mia', age: '5', email: 'user6@gmail.com',
                    password: '123456', password_confirmation: '123456')

kid7 = User.create!(role: 0, name: 'Renée', age: '9', email: 'user7@gmail.com',
                    password: '123456', password_confirmation: '123456')

kid8 = User.create!(role: 0, name: 'Michelle', age: '10', email: 'user8@gmail.com',
                    password: '123456', password_confirmation: '123456')

User.create!(role: 1, name: 'Menninkäinen', age: '793', email: 'user3@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 1, name: 'Älva', age: '532', email: 'user4@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 2, name: 'Dead Moroz', age: '4571', email: 'user0@mail.com',
             password: '123456', password_confirmation: '123456')
