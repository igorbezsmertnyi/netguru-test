require "rails_helper"

describe HttpClient do
  subject { described_class.new(conn, path) }

  let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
  let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }

  let!(:path) { "Godfather" }
  let!(:valid_response) { file_fixture("godfather.json").read }
  let!(:invalid_response) { file_fixture("error.json").read }

  describe "call" do
    context "with valid path" do
      it "return valid data" do
        stubs.get(path) do |env|
          expect(env.url.path).to eq("/#{path}")
          [
            200,
            { "Content-Type": "application/javascript" },
            valid_response
          ]
        end

        expect(subject.call).to eq(JSON.parse(valid_response))
        stubs.verify_stubbed_calls
      end
    end

    context "with invalid data" do
      let!(:path) { "Invalid" }

      it "return not found resonse" do
        stubs.get(path) do |env|
          expect(env.url.path).to eq("/#{path}")
          [
            404,
            { "Content-Type": "application/javascript" },
            invalid_response
          ]
        end

        expect(subject.call).to eq(JSON.parse(invalid_response))
        stubs.verify_stubbed_calls
      end
    end
  end
end
