require "rails_helper"

describe "Movies requests", type: :request do
  let!(:movie) { create(:movie, title: "Godfather").decorate }

  describe "index" do
    before do
      visit movies_path
    end

    describe "movies list" do
      context "with one movie" do
        it "should display right title" do
          expect(page).to have_selector("h1", text: "Movies")
        end

        it "should display one movies" do
          expect(page).to have_selector("table tr", count: 1)
        end
      end

      context "with many movies" do
        let!(:movies) { create_list(:movie, 20) }

        before do
          visit movies_path
        end

        it "should display 10 movies" do
          expect(page).to have_selector("table tr", count: 10)
        end

        it "should display pagination" do
          expect(page).to have_selector(".apple_pagination")
        end
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

  describe "send_info" do
    context "when user unauthorize" do
      before(:each) do
        visit send_info_movie_path(movie)
      end

      it "should redirected to new session path" do
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    context "when user authorized" do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
        visit send_info_movie_path(movie)
      end

      it "should display flash message" do
        expect(page).to have_selector(".alert", text: "Email sent with movie info")
      end
    end
  end

  describe "export" do
    context "when user unauthorize" do
      before(:each) do
        visit export_movies_path
      end

      it "should redirected to new session path" do
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    context "when user authorized" do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
        visit export_movies_path(movie)
      end

      it "should display flash message" do
        expect(page).to have_selector(".alert", text: "Movies exported")
      end
    end
  end
end
