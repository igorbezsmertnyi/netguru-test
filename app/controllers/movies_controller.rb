class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  def index
    @movies = Movie.all.decorate
  end

  def show
    @movie = Movie.find(params[:id]).decorate
  end

  def send_info
    MovieInfoMailer.send_info(current_user.id, params[:id]).deliver_later
    redirect_back(fallback_location: root_path, notice: "Email sent with movie info")
  end

  def export
    Movies::ExportJob.perform_later(current_user.id)
    redirect_to root_path, notice: "Movies exported"
  end
end
