class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  private

  def get_user(user_id)
    User.find(user_id)
  end

  def get_movie(movie_id)
    Movie.find(movie_id)
  end
end
