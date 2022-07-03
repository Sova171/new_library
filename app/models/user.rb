class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy

  #favorite
  has_many :favorites, class_name: "Favorite", foreign_key: :user_id, dependent: :destroy
  has_many :favorites_book, through: :favorites, source: :book

  def follow_book(book)
    favorites.create(book_id: book.id)
  end

  def unfollow_book(book)
    favorites.find_by(book_id: book.id).destroy
  end

  def following_book?(book)
    favorites_book.include?(book)
  end

  #rating
  has_many :ratings, class_name: "RatingBook", foreign_key: :user_id, dependent: :destroy
  has_many :ratings_book, through: :ratings, source: :book

  def rating_book(book, rating)
    ratings.create(book_id: book.id, rating_id: rating)
  end

  def unrating_book(book)
    ratings.find_by(book_id: book.id).destroy
  end

  def already_rating?(book)
    ratings_book.include?(book)
  end
end
