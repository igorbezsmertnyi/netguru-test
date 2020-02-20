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
        title:  response[:data][:attributes][:title],
        plot:   response[:data][:attributes][:plot],
        rating: response[:data][:attributes][:rating],
        poster: response[:data][:attributes][:poster]
      }
    end
  end
end
