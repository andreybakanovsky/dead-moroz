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

lego_mindstorm_kits = <<~DTEXT
  The system communicates with an Apple or Android tablet via Bluetooth. \
  The review notes that the programming language is a bit simplistic, allowing actions to occur \
  due to stimulus, but no real conditional tests and branches. In addition to motor control, \
  the device comes with blocks that can sense motion and color (see right). \
  Builders can integrate the blocks with other Lego designs, too.
DTEXT

boost_creative_toolbox = <<~DTEXT
  Discover a top gift for Formula E racing and Porsche fans aged 9+ with this fast-paced LEGO \
  Technic Formula E Porsche 99X Electric (42137) pull-back race car toy. \
  Kids enjoy an immersive build, crafting all the details of the Porsche race car, \
  then recreate all the action of a real race day using the 2 pull-back motors and LEGO Technic AR app. \
  Bring the race to life Using augmented reality, the app lets kids immerse themselves in the \
  role of a top Porsche Formula E driver. They'll choosewhich circuit to race on, make decisions \
  about energy management and use their skills to work their way up in the race. Using the 2 pull-back \
  motors, kids will decide how much to charge the car's energy before pushing the trigger to see the car \
  race along the AR track right in front of them! A great introduction to engineering LEGO Technic building \
  sets feature realistic movement and mechanisms that introduce LEGO builders to the universe of engineering \
  in an approachable and realistic way.
DTEXT

lego_mindstorm_kits2 = <<~DTEXT
  - Robotics construction set with powerful ARM9 processor
  - Programmable brick with intuitive user interface and sound
  - 3 interactive servo motors to move robot in multiple directions
  - Includes infrared, touch and color sensors
DTEXT

samsung_galaxy_s21 = <<~DTEXT
  Screen size (inches)- 6.80
  Touchscreen -	Yes
  Resolution -	1440x3220 pixels
  Protection type -	Gorilla Glass
  Pixels per inch (PPI) -	515
  -
  Processor -	2.2GHz octa-core (3x2.8GHz + 4x2.2GHz + 1x2.9GHz)
  Processor make -	Samsung Exynos 2100
  RAM -	12GB
  Internal storage -	128GB
  -
  Wi-Fi -	Yes
  Wi-Fi standards supported -	802.11 a/b/g/n/ac/ax
  GPS -	Yes
  Bluetooth -	Yes, v 5.00
  NFC -	Yes
  USB Type-C -	Yes
  Number of SIMs -	2
DTEXT

samsung_Galaxy_S22 = <<~DTEXT
  The device features a 6.8 inches Dynamic AMOLED 2X display that has a 1440 x 3200 pixels resolution. \
  The device comes in Black and others. The smartphone is integrated with a Single SIM (Nano-SIM and/or eSIM) \
  or Dual SIM (Nano-SIM and/or eSIM, dual stand-by).

  Samsung Galaxy S22 Ultra 5G is packed with 8 GB and 12 GB RAM with 128 GB, 256 GB, 512 GB, and 1 TB internal \
  storage. It is fueled with a non-removable Li-Po 5000 mAh battery + Fast charging 45W + \
  USB Power Delivery 3.0 + Fast Qi/PMA wireless charging 15W + Reverse wireless charging 4.5W.

  The rear camera of the smartphone consists of a quad camera, which consists of 108 MP (wide) + \
  10 MP (telephoto) + 10 MP (telephoto) + 12 MP (ultrawide) while on the front there is a 40 MP camera. \
  The device runs on the Android 12 + One UI 4.1
  operating system.
DTEXT

samsung_galaxy_s21_1 = <<~DTEXT
  The Samsung Galaxy S21 Ultra 5G doubles up as an excellent device for media consumption. \
  The 6.8-inch AMOLED display gets incredibly bright, and colours look rich and punchy. \
  The 5,000mAh battery capacity is the same as what the Galaxy S20 Ultra had, and easily \
  lasts for more than a full day of heavy to medium usage. The new design makes the Galaxy S21 \
  Ultra 5G look way better than previous models. Samsung's new contour-cut design for the camera \
  module is unique, and manages to mask the camera bulge pretty well.
DTEXT

schwinn = <<~DTEXT
  Schwinn 24 in. Girl's Bike for Ages 8-Years to 12-Years in Purple S7329TR
  BEST FOR: All types of neighborhood riders, from school commuters to city explorers
  SEAT HEIGHT (24″ size): 27″ – 33″
  WEIGHT (24″ 500 model): 29.7 lbs.
  GEARS:  All 6-speed with grip shift, except 20″ 100 is a single-speed
  BRAKES: Dual handbrakes
DTEXT

jacket = <<~DTEXT
  Type: Winter Pet Dog Clothes Thick Warm Dogs Jacket Coat with Harness Windproof Puppy \
  Jumpsuit for Small Medium Large Dogs Cat Bulldog
  Feature: Windproof/Easy Wear/Comfortable/Soft
  Material: Fleece
  Season: Autumn/Winter
  Color: Grey
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
Gift.create!(
  name: 'a kit lego electronics',
  description: 'Could you please, something from https://www.browndoggadgets.com/',
  giftable_type: Good.name,
  giftable_id: good1.id,
  images: [File.open(Rails.root.join('public/images/1_user/gift/Logo_electronic.jpeg'))]
)
Gift.create!(
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
good6 = Good.create!(
  year: 2022,
  content: 'I fed birds and squirrels in winter',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2022.jpeg'))]
)

Gift.create!(
  name: 'A winter jumpsuit for the dog ',
  description: 'Back - 10" (inch), chest - 16", neck - 31", for instance: https://www.aliexpress.com/item/4000053326979.html',
  giftable_type: Good.name,
  giftable_id: good6.id,
  images: [File.open(Rails.root.join('public/images/2_user/gift/dog_clothes_0.png')),
           File.open(Rails.root.join('public/images/2_user/gift/dog_clothes_1.png'))]
)
Gift.create!(
  name: 'Samsung Galaxy S21 Ultra 5G',
  description: description2,
  giftable_type: Good.name,
  giftable_id: good6.id,
  images: [File.open(Rails.root.join('public/images/2_user/gift/galaxy_S21_Ultra.jpg'))]
)
good7 = Good.create!(
  year: 2021,
  content: 'I helped my mom to care for flowers',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2021.jpeg'))]
)
good8 = Good.create!(
  year: 2020,
  content: 'I read the book to my brother in the evenings',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2020.jpeg'))]
)
good9 = Good.create!(
  year: 2019,
  content: 'I planted a tree and flowers',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2019.jpeg')),
           File.open(Rails.root.join('public/images/2_user/good/2019_2.jpeg')),
           File.open(Rails.root.join('public/images/2_user/good/2019_3.jpeg'))]
)
good10 = Good.create!(
  year: 2018,
  content: 'I cared for the younger brother',
  user_id: kid2.id,
  images: [File.open(Rails.root.join('public/images/2_user/good/2018.jpeg'))]
)
good11 = Good.create!(
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

elf1 = User.create!(role: 1, name: 'Menninkäinen', age: '793', email: 'elf1@gmail.com',
                    password: '123456', password_confirmation: '123456')
review1 = Review.create!(
  user_id: elf1.id,
  good_id: good1.id,
  grade: 10,
  comment: '{"comment":"The lad’s getting stronger!","author":"Menninkäinen"}'
)

Gift.create!(
  name: 'a labrador puppy',
  description: "Ok) Let's be the labrador puppy",
  giftable_type: Review.name,
  giftable_id: review1.id,
  images: [File.open(Rails.root.join('public/images/11_elf/gift/a_labrador_puppy.jpg'))]
)

Gift.create!(
  name: 'Lego Mindstorm kits',
  description: lego_mindstorm_kits,
  giftable_type: Review.name,
  giftable_id: review1.id,
  images: [File.open(Rails.root.join('public/images/11_elf/gift/Lego_Mindstorm_kits.png'))]
)

elf2 = User.create!(role: 1, name: 'Älva', age: '532', email: 'elf2@gmail.com',
                    password: '123456', password_confirmation: '123456')
review2 = Review.create!(
  user_id: elf2.id,
  good_id: good1.id,
  grade: 9,
  comment: '{"comment":"stronger and srtonger!","author":"Älva"}'
)

Gift.create!(
  name: 'LEGO Technic Formula E Porsche 99X Electric 42137 Model Building Kit (422 Pieces)',
  description: boost_creative_toolbox,
  giftable_type: Review.name,
  giftable_id: review2.id,
  images: [File.open(Rails.root.join('public/images/12_elf/gift/LEGO_Technic_Formula.png'))]
)
review3 = Review.create!(
  user_id: elf2.id,
  good_id: good6.id,
  grade: 10,
  comment: '{"comment":"A caring girl to our friends","author":"Älva"}'
)

Gift.create!(
  name: 'Samsung Galaxy S21 Ultra 5G',
  description: samsung_galaxy_s21,
  giftable_type: Review.name,
  giftable_id: review3.id,
  images: [File.open(
    Rails.root.join('public/images/12_elf/gift/Samsung_Galaxy_S21_Ultra_5G_2.png')
  )]
)

elf3 = User.create!(role: 1, name: 'Tinuviel', age: '479', email: 'elf3@gmail.com',
                    password: '123456', password_confirmation: '123456')
review4 = Review.create!(
  user_id: elf3.id,
  good_id: good1.id,
  grade: 7,
  comment: '{"comment":"a tough kid!","author":"Tinuviel"}'
)

Gift.create!(
  name: 'The labrador puppy',
  description: 'he is called Charlie',
  giftable_type: Review.name,
  giftable_id: review4.id,
  images: [File.open(
    Rails.root.join('public/images/13_elf/gift/a_labrador_puppy_2.jpeg')
  )]
)

review5 = Review.create!(
  user_id: elf3.id,
  good_id: good6.id,
  grade: 8,
  comment:  '{"comment":"delightful behavior over the years)","author":"Tinuviel"}'
)

Gift.create!(
  name: 'Samsung Galaxy S22 Ultra 5G',
  description: samsung_Galaxy_S22,
  giftable_type: Review.name,
  giftable_id: review5.id,
  images: [File.open(Rails.root.join('public/images/13_elf/gift/Samsung_Galaxy_S22_Ultra_5G.png'))]
)

Gift.create!(
  name: 'A jumpsuit for the dog ',
  description: 'exactly as it was requested',
  giftable_type: Review.name,
  giftable_id: review5.id,
  images: [File.open(Rails.root.join('public/images/13_elf/gift/a_jumpsuit.png'))]
)

elf4 = User.create!(role: 1, name: 'Sânziana', age: '501', email: 'elf4@gmail.com',
                    password: '123456', password_confirmation: '123456')
review6 = Review.create!(
  user_id: elf4.id,
  good_id: good1.id,
  grade: 10,
  comment: '{"comment":"","author":"Sânziana"}'
)

Gift.create!(
  name: 'LEGO® MINDSTORMS® EV3',
  description: lego_mindstorm_kits2,
  giftable_type: Review.name,
  giftable_id: review6.id,
  images: [File.open(Rails.root.join('public/images/14_elf/gift/lego-mindstorms-ev3-us-version_1.jpg'))]
)

review7 = Review.create!(
  user_id: elf4.id,
  good_id: good6.id,
  grade: 10,
  comment: '{"comment":"","author":"Sânziana"}'
)
Gift.create!(
  name: 'Samsung Galaxy S21 Ultra 5G',
  description: samsung_galaxy_s21_1,
  giftable_type: Review.name,
  giftable_id: review7.id,
  images: [File.open(Rails.root.join('public/images/14_elf/gift/Samsung_Galaxy_S21_Ultra_5G.png'))]
)

Gift.create!(
  name: 'A warm jumpsuit for the dog',
  description: jacket,
  giftable_type: Review.name,
  giftable_id: review7.id,
  images: [File.open(Rails.root.join('public/images/14_elf/gift/a_jumpsuit.png'))]
)

elf5 = User.create!(role: 1, name: 'Ingálvur', age: '1388', email: 'elf5@gmail.com',
                    password: '123456', password_confirmation: '123456')
review8 = Review.create!(
  user_id: elf5.id,
  good_id: good6.id,
  grade: 10,
  comment: '{"comment":"!!!","author":"Ingálvur"}'
)

Gift.create!(
  name: 'Bike, Schwinn',
  description: schwinn,
  giftable_type: Review.name,
  giftable_id: review8.id,
  images: [File.open(Rails.root.join('public/images/15_elf/gift/bike.png'))]
)

Gift.create!(
  name: 'Dogs Jacket',
  description: jacket,
  giftable_type: Review.name,
  giftable_id: review8.id,
  images: [File.open(Rails.root.join('public/images/15_elf/gift/a_jumpsuit.png'))]
)

User.create!(role: 2, name: 'Dead Moroz', age: '4571', email: 'user0@mail.com',
             password: '123456', password_confirmation: '123456')
