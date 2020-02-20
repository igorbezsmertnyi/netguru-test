require "csv"

class CsvExporter
  def initialize(klass, path, headers)
    @headers = headers
    @path    = path
    @klass   = klass
  end

  def call
    CSV.open(path, "wb", csv_options) do |csv|
      klass.all.each do |row|
        csv << row.attributes.values_at(*headers)
      end
    end
    sleep(5) # this emulates long export, do not remove
  end

  private

  attr_reader :klass, :path, :headers

  def csv_options
    {
      write_headers: true,
      headers: headers,
      col_sep: ";"
    }
  end
end
