# frozen_string_literal: true

class Errors::InvalidSortParam < StandardError
  def message
    'Invalid sort param'
  end
end
