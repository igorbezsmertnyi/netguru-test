class TopCommentsController < ApplicationController
  def index
    @top = TopComment.last(10)
  end
end
