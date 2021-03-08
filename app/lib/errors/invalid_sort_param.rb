module Errors
  class InvalidSortParam < StandardError
    def message
      'Invalid sort param'
    end
  end
end
