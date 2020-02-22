require "rails_helper"

RSpec.describe Api::V1::MoviesController, type: :controller do
  before(:each) { action }

  describe "INDEX" do
    let(:genres) { create_list(:genre, 5, :with_movies) }
    let!(:action) { get :index }

    it { expect(response.status).to eq(200) }
    it "should return list of existing movies" do
      expect(response.body).to eq(MovieSerializer.new(Movie.all).serialized_json)
    end
  end

  describe "SHOW" do
    let!(:movie) { create(:movie) }
    let!(:action) { get :show, params: { id: movie.id } }

    it { expect(response.status).to eq(200) }
    it "should return movie" do
      expect(response.body).to eq(MovieSerializer.new(movie).serialized_json)
    end
  end
end
