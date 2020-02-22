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

require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to allow_value("Hello world").for(:text) }
  it { is_expected.not_to allow_value("").for(:text) }
end
