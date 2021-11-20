module DataProviders
  class Base
    def retrieve(file_path)
      raise NotImplementedError
    end
  end
end
