# HttpClient responsible for performing HTTP reuests

class HttpClient
  def initialize(conn, path)
    @conn = conn
    @path = path
  end

  def call
    @response = conn.get(parametrize_path)
    parsed_response
  end

  private

  attr_reader :conn, :path, :response

  def parametrize_path
    URI.escape(path)
  end

  def parsed_response
    JSON.parse(response.body).with_indifferent_access
  end
end
