# CommentsController responsible for managing comments

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :load_movie,         only: %i[create destroy]

  load_and_authorize_resource        only: :destroy

  def create
    @comment = @movie.comments.new(comments_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to movie_path(@movie), notice: "Comment successfully added!"
    else
      redirect_to movie_path(@movie), flash: { error: @comment.errors.full_messages }
    end
  end

  def destroy
    if @comment.destroy
      redirect_to movie_path(@movie), notice: "Comment successfully destroyed!"
    else
      redirect_to movie_path(@movie), flash: { error: @comment.errors.full_messages }
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end
end
