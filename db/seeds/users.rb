# frozen_string_literal: true

User.delete_all

def create_user
  user = User.create(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end

12.times { create_user }
