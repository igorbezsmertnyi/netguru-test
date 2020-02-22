# HttpClient responsible for performing HTTP reuests

class HttpClient
  def initialize(path)
    @schema = "https://"
    @host   = "pairguru-api.herokuapp.com"
    @prefix = "/api/v1/movies/"
    @path   = path
  end

  def call
    @response = Faraday.get(url)
    parsed_response
  rescue Faraday::ResourceNotFound
    empty_response
  end

  private

  attr_reader :schema, :host, :prefix, :path, :response

  def parametrize_path
    URI.escape(path)
  end

  def url
    schema + host + prefix + parametrize_path
  end

  def parsed_response
    JSON.parse(response.body).with_indifferent_access
  end

  def empty_response
    { data: { attributes: {} } }
  end
end
