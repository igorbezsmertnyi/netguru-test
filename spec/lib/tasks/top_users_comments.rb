require "support/shared_contexts/rake.rb"

describe "top_users_comments" do
  include_context "rake"

  let!(:users) { create_list(:user, 5, :with_comments) }

  it "should change count of TopComment" do
    expect { subject.invoke }.to change { TopComment.count }.by(5)
  end
end
