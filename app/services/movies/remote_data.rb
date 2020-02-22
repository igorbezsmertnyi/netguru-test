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
        title:  response.dig(:data, :attributes, :title),
        plot:   response.dig(:data, :attributes, :plot),
        rating: response.dig(:data, :attributes, :rating),
        poster: response.dig(:data, :attributes, :poster)
      }
    end
  end
end
