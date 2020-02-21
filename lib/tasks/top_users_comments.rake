# task should be runned each day in 00:00
desc "Calculate max comments count in the user scope from the last 7 days"

task top_user_comments: :environment do
  hash = User.
    joins(:comments).
    where("comments.created_at BETWEEN ? AND ?", Time.zone.now.beginning_of_day - 10.days, Time.zone.now.end_of_day).
    group("user_id").
    limit(10).
    count
  
  hash.each do |key, value|
    TopComment.create(
      user_id: key,
      count:   value
    )
  end
end
