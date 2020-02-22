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

# TopComment contains 10 users with max counts of comments in last 7 days

class TopComment < ApplicationRecord
  belongs_to :user

  default_scope { order(count: :desc, created_at: :desc) }
end
