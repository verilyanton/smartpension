module ExternalInterfaces
  class Base
    def execute_use_case(args)
      raise NotImplementedError
    end
  end
end
