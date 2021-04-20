module Errors
  class InvalidEmailFormat < StandardError
    def message
      'Invalid email format'
    end
  end
end
