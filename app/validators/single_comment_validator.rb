# SingleCommentValidator responsible for validation if user have only one comment belongs the movie

class SingleCommentValidator < ActiveModel::Validator
  def validate(record)
    if Comment.where(user_id: record.user_id, movie_id: record.movie_id).any?
      record.errors[:base] << "Your already have a comment on this movie"
    end
  end
end
