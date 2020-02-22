# Api::V1::MoviesController responsible for API interface

class Api::V1::MoviesController < ApplicationController
  before_action :load_movie, only: :show

  def index
    render json: ::MovieSerializer.new(Movie.all).serialized_json
  end

  def show
    render json: ::MovieSerializer.new(@movie).serialized_json
  end

  private

  def load_movie
    @movie = Movie.find(params[:id])
  end
end
