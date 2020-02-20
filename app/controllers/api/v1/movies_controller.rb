class Api::V1::MoviesController < ApplicationController
  before_action :load_movie, only: :show

  def index
    render json: ::MovieSerializer.new(Movie.all).serializable_hash
  end

  def show
    render json: ::MovieSerializer.new(@movie).serializable_hash
  end

  private

  def load_movie
    @movie = Movie.find(params[:id])
  end
end
