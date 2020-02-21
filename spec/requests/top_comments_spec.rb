require "rails_helper"

describe "Top comments requests", type: :request do
  let!(:users) { create_list(:user, 5, :with_top_comments) }

  describe "top users list" do
    before { visit top_comments_path }

    it "should display list" do
      expect(page).to have_selector("tbody tr", count: 5)
    end
  end
end
