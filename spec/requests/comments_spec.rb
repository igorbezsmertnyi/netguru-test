require "rails_helper"

describe "Comments requests", type: :request do
  let!(:movie) { create(:movie, title: "Godfather") }
  let!(:user)  { create(:user) }

  describe "comments list" do
    let!(:comment) { create(:comment, movie: movie, user: user) }

    before do
      visit movie_path(movie)
    end

    it "should display comment" do
      expect(page).to have_selector(".comment-text", text: comment.text)
    end
  end

  describe "comments form" do
    context "when user unauthorized" do
      it "should not display comment form" do
        expect(page).not_to have_selector("#new_comment")
      end
    end

    context "when user authorized" do
      before do
        sign_in user
        visit movie_path(movie)
      end

      it "should display comment form" do
        expect(page).to have_selector("#new_comment")
      end

      context "when user haven't comments" do
        describe "create comment" do
          let!(:comment) { build(:comment, movie: movie, user: user) }

          before do
            fill_in("comment_text", with: comment.text)
            find('input[name="commit"]').click
          end

          it "should render new comment" do
            expect(page).to have_selector(".comment-text", text: comment.text)
          end

          it "should display flash" do
            expect(page).to have_selector(".alert", text: "Comment successfully added!")
          end
        end
      end

      context "when user have comments" do
        let!(:comment) { create(:comment, movie: movie, user: user) }
        let!(:new_comment) { build(:comment, movie: movie, user: user) }

        describe "create comment" do
          it "should return an error" do
            fill_in("comment_text", with: new_comment.text)
            find("input[name='commit']").click

            expect(page).to have_selector(".alert", text: "Your already have a comment on this movie")
          end
        end

        describe "delete comment and create new" do
          before(:each) do
            sign_in user
            visit movie_path(movie)
            find(".delete-comment-#{comment.id}").click
            fill_in("comment_text", with: new_comment.text)
            find("input[name='commit']").click
          end

          it "should render new comment" do
            expect(page).to have_selector(".comment-text", text: new_comment.text)
          end

          it "should display flash" do
            expect(page).to have_selector(".alert", text: "Comment successfully added!")
          end
        end
      end
    end
  end
end
