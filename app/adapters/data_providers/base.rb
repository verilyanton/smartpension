module DataProviders
  class Base
    def retrieve(file_path)
      raise NotImplementedError
    end

    def save(file_path, data)
      raise NotImplementedError
    end

    def exist?(file_path)
      raise NotImplementedError
    end
  end
end
