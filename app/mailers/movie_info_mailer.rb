class MovieInfoMailer < ApplicationMailer
  def send_info(user_id, movie_id)
    @user = get_user(user_id)
    @movie = get_movie(movie_id)
    sleep(3) # this emulates long email sending, do not remove
    mail(to: @user.email, subject: "Info about movie #{@movie.title}")
  end

  private

  def get_user(user_id)
    user ||= User.find(user_id)
  end

  def get_movie(movie_id)
    movie ||= Movie.find(movie_id)
  end
end
