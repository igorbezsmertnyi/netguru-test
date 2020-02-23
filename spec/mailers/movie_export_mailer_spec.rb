require "rails_helper"

describe MovieExportMailer, type: :mailer do
  describe "send_file" do
    let(:user) { create(:user) }
    let(:mail) { described_class.send_file(user.id, "spec/fixtures/files/test.csv").deliver_now }

    it "renders the subject" do
      expect(mail.subject).to eq("Your export is ready")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "should have attachment" do
      expect(mail.attachments.size).to eq(1)
    end
  end
end
