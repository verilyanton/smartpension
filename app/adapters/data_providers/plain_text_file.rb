require_relative 'base'

module DataProviders
  class PlainTextFile < Base
    def retrieve(file_path)
      File.read(file_path).split
    end

    def save(file_path, data)
      File.write(file_path, data)
    end

    def exist?(file_path)
      File.file?(file_path)
    end
  end
end
