# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy  

  validates :title, presence: true
  validates :description, presence: true

  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  has_many :ratings
  has_many :rated_by_users, through: :ratings, source: :user

  def average_rating
    ratings.average(:rating).to_f.round(1)
  end

  has_and_belongs_to_many :categories
end
