require "rails_helper"

describe Movies::Exporter do
  subject { described_class.new(user.id, path) }

  let(:path)  { "tmp/test.csv" }
  let(:user)  { create(:user) }
  let(:movie) { create(:movie) }

  describe "call" do
    before do
      clear_enqueued_jobs
      subject.call
    end

    it "should generate test.csv" do
      expect(File.exist?(path)).to be_truthy
    end

    it "should deliver email" do
      expect(enqueued_jobs.size).to eq(1)
    end
  end
end
