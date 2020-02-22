# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :genre
  has_many   :comments

  validates_with TitleBracketsValidator

  def additional_data
    Rails.cache.fetch([Movie, id], expired_id: 1.hour) do
      Movies::RemoteData.new(title).get
    end
  end
end
