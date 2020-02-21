class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates_with SingleCommentValidator

  validates :text, presence: :true
end
