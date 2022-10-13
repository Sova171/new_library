# frozen_string_literal: true

User.delete_all

User.new({ email: 'admin@example.com', password: 'password', password_confirmation: 'password' }).save!
User.new({ email: 'vladkuzak@gmail.com', password: 'vlad1972', password_confirmation: 'vlad1972' }).save!
User.new({ email: 'boris_soltus@gmail.com', password: 'boris_', password_confirmation: 'boris_' }).save!

def create_user
  user = User.create(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end

12.times { create_user }
