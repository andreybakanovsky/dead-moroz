module Statistics
  class BaseQuery
    def initialize(params)
      @params = params
    end

    def self.call(...)
      new(...).execute
    end
  end
end
