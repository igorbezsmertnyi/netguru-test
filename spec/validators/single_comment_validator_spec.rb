require "rails_helper"

describe SingleCommentValidator do
  subject { ValidatableComment.new(user_id: user.id, movie_id: movie.id) }

  shared_examples "has valid data" do
    it "should be valid" do
      expect(subject).to be_valid
    end
  end

  shared_examples "has invalid data" do
    it "should not be valid" do
      expect(subject).not_to be_valid
    end
  end

  context "with user without comments" do
    let(:movie) { create(:movie) }
    let(:user)  { create(:user) }

    it_behaves_like "has valid data"
  end

  context "with user with comments" do
    let!(:comment) { create(:comment, movie: movie, user: user) }
    let(:movie)   { create(:movie) }
    let(:user)    { create(:user) }

    it_behaves_like "has invalid data"
  end
end

class ValidatableComment
  include ActiveModel::Validations
  validates_with SingleCommentValidator
  attr_accessor :user_id, :movie_id

  def initialize(user_id:, movie_id:)
    @user_id  = user_id
    @movie_id = movie_id
  end
end
