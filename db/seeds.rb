# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#100.times do |n|
#  email = Faker::Internet.email
#  name = Faker::StarTrek.character
#  uid = Faker::Code.isbn
#  password = "password"
#  User.create!(email: email,
#               name: name,
#               uid: uid,
#               password: password,
#               password_confirmation: password,
#               )
#end

n = 1
u = 10
t = 5
u2 = u + 1
while n <= 30
  content = Faker::Movie.quote
  Topic.create!(
    content: content,
    user_id: u,
  )

  content = Faker::Book.title
  Comment.create!(
    content: content,
    user_id: u,
    topic_id: t,
  )

  Conversation.create!(
    sender_id: u,
    recipient_id: u2,
  )
  n = n + 1
  u = u + 1
  t = t + 1
  u2 = u2 + 1
end

