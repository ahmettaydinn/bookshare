# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :body, presence: true
end
