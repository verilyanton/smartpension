require './app/adapters/data_providers/base'

module DataProviders
  class PlainTextFile < Base
    def retrieve(file_path)
      File.read(file_path).split
    end
  end
end
