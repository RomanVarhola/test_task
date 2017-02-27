# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DatabaseCleaner.clean_with(:truncation, :only => ['users','articles', 'comments'])

p 'Cleaning tables complete..'

USERS_COUNT = 5

p 'Creating me'
 
  # Создаем админа
  pass = '12345678'
  User.create!(
      email:    'varkroman@mail.ru',
      password: pass,
      password_confirmation: pass,
      first_name: 'Roman',
      last_name: 'Varhola',
    )

p 'Creating users..'
  
  USERS_COUNT.times do |i|
   pass =  '12345678'
   User.create!(
        password:  pass,
        password_confirmation: pass,
        first_name:      Faker::Name.first_name,
        last_name:   Faker::Name.last_name,
        email:     "#{i}_" + Faker::Internet.safe_email, 
   )
    puts "Created users ##{i}" if i == USERS_COUNT 
  end

p 'Creating articles'

users = User.all
  users.each do |user|
    2.times do | i |
      article = user.articles.create!(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(5, true, 10)
        )
    end
  end

