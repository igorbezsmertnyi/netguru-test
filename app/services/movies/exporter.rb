# Movies::Exporter responsible for generating csv file with movies and sending it to the user

module Movies
  class Exporter
    def initialize(user_id, path = "tmp/movies.csv")
      @user_id = user_id
      @path    = path
    end

    def call
      generate_csv
      send_email
    end

    private

    attr_reader :user_id, :path

    def generate_csv
      CsvExporter.new(Movie, path, %w[title description]).call
    end

    def send_email
      MovieExportMailer.send_file(user_id, path).deliver_later
    end
  end
end
