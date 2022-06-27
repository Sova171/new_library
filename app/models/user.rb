class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
