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

# MovieSerializer responsible for serializing Movies objects

class MovieSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title
end
