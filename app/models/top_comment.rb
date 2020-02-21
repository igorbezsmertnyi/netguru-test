class TopComment < ApplicationRecord
  belongs_to :user

  default_scope { order(count: :desc, created_at: :desc) }
end
