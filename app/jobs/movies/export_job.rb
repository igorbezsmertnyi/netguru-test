module Movies
  class ExportJob < ActiveJob::Base
    queue_as :movies_export

    def perform(user_id)
      Movies::Exporter.new(user_id).call
    end
  end
end
