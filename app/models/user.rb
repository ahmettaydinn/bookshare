class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments, dependent: :destroy 

  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
end
