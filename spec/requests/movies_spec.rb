require "rails_helper"

describe "Movies requests", type: :request do
  let!(:movie) { create(:movie, title: "Godfather").decorate }

  describe "index" do
    before(:each) do
      visit movies_path
    end

    describe "movies list" do
      it "displays right title" do
        expect(page).to have_selector("h1", text: "Movies")
      end
  
      it "displays movies" do
        expect(page).to have_selector("table tr", count: 1)
      end
    end
  
    describe "movie item" do
      it "should have rating" do
        expect(page).to have_selector(".rating", text: "10/#{movie.rating}")
      end

      it "should have poster" do
        expect(page).to have_xpath("//img[@src='#{movie.cover}']")
      end
  
      it "should have plot" do
        expect(page).to have_selector(".plot", text: movie.plot)
      end
  
      it "should have description" do
        expect(page).to have_selector(".description", text: movie.description)
      end
    end
  end

  describe "show" do
    before(:each) do
      visit movie_path(movie)
    end

    describe "movie page" do
      it "should have title" do
        expect(page).to have_selector("h1", text: movie.title)
      end

      it "should have rating" do
        expect(page).to have_selector(".rating", text: "10/#{movie.rating}")
      end

      it "should have poster" do
        expect(page).to have_xpath("//img[@src='#{movie.cover}']")
      end

      it "should have plot" do
        expect(page).to have_selector(".plot", text: movie.plot)
      end

      it "should have description" do
        expect(page).to have_selector(".description", text: movie.description)
      end
    end
  end
end
