class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments, dependent: :destroy 

  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book

  has_many :ratings
  has_many :rated_books, through: :ratings, source: :book
end
