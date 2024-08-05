# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy  

  validates :title, presence: true
  validates :description, presence: true
end
