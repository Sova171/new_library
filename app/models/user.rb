# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  # registration using google
  def self.from_omniauth(provider_data)
    User.find_or_create_by(provider: provider_data.provider, uid: provider_data.uid) do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_many :lists, dependent: :destroy

  # favorite
  has_many :favorites, foreign_key: :user_id, dependent: :destroy
  has_many :favorites_book, through: :favorites, source: :book

  # rating
  has_many :rating_books, foreign_key: :user_id, dependent: :destroy
  has_many :rating, through: :rating_books, source: :book
end
