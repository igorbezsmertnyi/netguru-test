require "rails_helper"

describe CsvExporter do
  subject { described_class.new(Movie, path, headers) }

  let!(:movie)  { create(:movie) }
  let(:path)    { "tmp/test.csv" }
  let(:headers) { %w[title description] }

  describe "call" do
    before { subject.call }

    it "should generate test.csv" do
      expect(File.exist?(path)).to be_truthy
    end
  end
end
