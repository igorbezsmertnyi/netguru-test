# GenresController responsible for rendering genres and filtering movies by genres

class GenresController < ApplicationController
  def index
    @genres = Genre.all.decorate
  end

  def movies
    @genre = Genre.find(params[:id]).decorate
  end
end
