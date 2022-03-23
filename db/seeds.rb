# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

description1 = <<~DTEXT
  The Labrador retriever or Labrador is a British breed of retriever gun dog. \
  It was developed in the United Kingdom from fishing dogs imported from the colony of Newfoundland \
  (now a province of Canada), and was named after the Labrador region of that colony. \
  It is among the most commonly kept dogs in several countries, particularly in the Western world.
DTEXT

description2 = <<~DTEXT
  The Samsung Galaxy S21 Ultra is the headliner of the S21 series. \
  It's the first S series phone to support Samsung's S Pen. \
  Specifications are top-notch including Snapdragon 888 chipset, 5G capability, \
  up to 16gigs of RAM, and 512GB of storage. A 5000mAh battery keeps the lights on for this powerhouse. \
  In the camera department, a quad-camera setup is presented with two telephoto sensors.
  Could please see full description here https://www.gsmarena.com/samsung_galaxy_s21_ultra_5g-10596.php
DTEXT

kid = User.create!(role: 0, name: 'Henry', age: '11', email: 'user1@gmail.com',
                   password: '123456', password_confirmation: '123456',
                   avatar: 'https://avatars.dicebear.com/api/adventurer/183208.svg')
good1 = Good.create!(
  year: 2022,
  content: 'I have helped my grandfather to remove snow in the yard this winter',
  user_id: kid.id,
  images: [File.open(Rails.root.join('public/images/1_user/good/2022.jpeg')),
           File.open(Rails.root.join('public/images/1_user/good/2022_2.jpeg'))]
)
gift1 = Gift.create!(
  name: 'a kit lego electronics',
  description: 'Could you please, something from https://www.browndoggadgets.com/',
  giftable_type: Good.name,
  giftable_id: good1.id,
  images: [File.open(Rails.root.join('public/images/1_user/gift/Logo_electronic.jpeg'))]
)
gift2 = Gift.create!(
  name: 'a labrador puppy',
  description: description1,
  giftable_type: Good.name,
  giftable_id: good1.id,
  images: [File.open(Rails.root.join('public/images/1_user/gift/puppy.jpeg'))]
)

good2 = Good.create!(
  year: 2021,
  content: "I've made postcards for the whole family",
  user_id: kid.id,
  images: [File.open(Rails.root.join('public/images/1_user/good/2021.jpeg'))]
)
good3 = Good.create!(
  year: 2020,
  content: "I cared for my brother when my mom wasn't at home",
  user_id: kid.id,
  images: [File.open(Rails.root.join('public/images/1_user/good/2020.jpeg'))]
)
good4 = Good.create!(
  year: 2019,
  content: 'My grandfather and I planted six trees',
  user_id: kid.id,
  images: [File.open(Rails.root.join('public/images/1_user/good/2019.jpeg')),
           File.open(Rails.root.join('public/images/1_user/good/2019_2.jpeg')),
           File.open(Rails.root.join('public/images/1_user/good/2019_3.jpeg'))]
)
good5 = Good.create!(
  year: 2018,
  content: 'I fed animals in the zoo',
  user_id: kid.id,
  images: [File.open(Rails.root.join('public/images/1_user/good/2018.jpeg')),
           File.open(Rails.root.join('public/images/1_user/good/2018_2.jpeg')),
           File.open(Rails.root.join('public/images/1_user/good/2018_3.jpeg'))]
)

kid2 = User.create!(role: 0, name: 'Sofia', age: '8', email: 'user2@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/775350.svg')
good1 = Good.create!(
  year: 2022,
  content: 'I fed birds and squirrels in winter',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2022.jpeg'))]
)

gift1 = Gift.create!(
  name: 'A winter jumpsuit for the dog ',
  description: 'Back - 10" (inch), chest - 16", neck - 31", for instance: https://www.aliexpress.com/item/4000053326979.html',
  giftable_type: Good.name,
  giftable_id: good1.id,
  images: [File.open(Rails.root.join('public/images/2_user/gift/dog_clothes_0.png')),
           File.open(Rails.root.join('public/images/2_user/gift/dog_clothes_1.png'))]
)
gift2 = Gift.create!(
  name: 'Samsung Galaxy S21 Ultra 5G',
  description: description2,
  giftable_type: Good.name,
  giftable_id: good1.id,
  images: [File.open(Rails.root.join('public/images/2_user/gift/galaxy_S21_Ultra.jpg'))]
)
good2 = Good.create!(
  year: 2021,
  content: 'I helped my mom to care for flowers',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2021.jpeg'))]
)
good3 = Good.create!(
  year: 2020,
  content: 'I read the book to my brother in the evenings',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2020.jpeg'))]
)
good4 = Good.create!(
  year: 2019,
  content: 'I planted a tree and flowers',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2019.jpeg')),
           File.open(Rails.root.join('public/images/2_user/good/2019_2.jpeg')),
           File.open(Rails.root.join('public/images/2_user/good/2019_3.jpeg'))]
)
good5 = Good.create!(
  year: 2018,
  content: 'I cared for the younger brother',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2018.jpeg'))]
)
good6 = Good.create!(
  year: 2017,
  content: 'I sheltered a dog',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2017.jpeg')),
           File.open(Rails.root.join('public/images/2_user/good/2017_2.jpeg'))]
)

kid3 = User.create!(role: 0, name: 'Oliver', age: '7', email: 'user3@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/621213.svg')

kid4 = User.create!(role: 0, name: 'Aimée', age: '13', email: 'user4@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/645046.svg')

kid5 = User.create!(role: 0, name: 'William', age: '8', email: 'user5@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/40071.svg')

kid6 = User.create!(role: 0, name: 'Mia', age: '5', email: 'user6@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/832199.svg')

kid7 = User.create!(role: 0, name: 'Renée', age: '9', email: 'user7@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/346553.svg')

kid8 = User.create!(role: 0, name: 'Michelle', age: '10', email: 'user8@gmail.com',
                    password: '123456', password_confirmation: '123456',
                    avatar: 'https://avatars.dicebear.com/api/adventurer/516856.svg')

User.create!(role: 1, name: 'Menninkäinen', age: '793', email: 'user3@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 1, name: 'Älva', age: '532', email: 'user4@mail.com',
             password: '123456', password_confirmation: '123456')
User.create!(role: 2, name: 'Dead Moroz', age: '4571', email: 'user0@mail.com',
             password: '123456', password_confirmation: '123456')
