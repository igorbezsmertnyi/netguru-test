# TopCommentsController responsible for rendering top users

class TopCommentsController < ApplicationController
  def index
    @top = TopComment.last(10)
  end
end
