# Movies::Movies responsible for executeing request to remote API and serializing response

module Movies
  class RemoteData
    def initialize(title)
      @title = title
    end

    def get
      @response = get_data
      serialize_data
    end

    private

    attr_reader :title, :response

    def get_data
      HttpClient.new(title).call
    end

    def serialize_data
      {
        title:  response.dig(:data, :attributes, :title).to_s,
        plot:   response.dig(:data, :attributes, :plot).to_s,
        rating: response.dig(:data, :attributes, :rating).to_s,
        poster: response.dig(:data, :attributes, :poster).to_s
      }
    end
  end
end
