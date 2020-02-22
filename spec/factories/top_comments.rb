# == Schema Information
#
# Table name: top_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  count      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :top_comment do
    user
    count { Faker::Number.within(range: 1..10) }
  end
end
