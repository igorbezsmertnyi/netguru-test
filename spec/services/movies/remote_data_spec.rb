require "rails_helper"

describe Movies::RemoteData do
  subject { described_class.new(title) }

  let!(:title) { "Godfather" }
  let!(:mock) { file_fixture("godfather.json").read }

  describe "get" do
    before do
      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get(title) { [200, {}, mock] }
      end

      conn = Faraday.new { |b| b.adapter(:test, stubs) }

      allow(subject).to receive(:connection) { conn }
    end

    it "should have title" do
      res = subject.get
      expect(res[:title]).to eq("Godfather")
    end

    it "should have plot" do
      res = subject.get
      expect(res[:plot]).to eq("The aging patriarch")
    end

    it "should have rating" do
      res = subject.get
      expect(res[:rating]).to eq("9.2")
    end

    it "should have poster" do
      res = subject.get
      expect(res[:poster]).to eq("/godfather.jpg")
    end
  end
end
