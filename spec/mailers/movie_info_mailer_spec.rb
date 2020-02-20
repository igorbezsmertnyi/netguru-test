require "rails_helper"

describe MovieInfoMailer, type: :mailer do
  describe "send_info" do
    let(:user)  { create(:user) }
    let(:movie) { create(:movie) }
    let(:mail)  { described_class.send_info(user.id, movie.id).deliver_now }

    it "renders the subject" do
      expect(mail.subject).to eq("Info about movie #{movie.title}")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "should have movie title" do
      expect(mail.body.encoded).to match(movie.title)
    end
  end
end
