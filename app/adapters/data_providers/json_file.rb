require 'json'
require './app/adapters/data_providers/base'

module DataProviders
  class JsonFile < Base
    def retrieve(file_path)
      file = File.read(file_path)

      JSON.parse(file)
    end

    def save(file_path, data)
      json_data = data.to_json
      File.write(file_path, json_data)

      json_data
    end

    def exist?(file_path)
      File.file?(file_path)
    end
  end
end
