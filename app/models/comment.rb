# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  movie_id   :integer
#  text       :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Comment responsible for managing users comments

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates_with SingleCommentValidator

  validates :text, presence: true
end
