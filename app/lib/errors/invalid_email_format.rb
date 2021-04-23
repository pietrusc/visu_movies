# frozen_string_literal: true

class Errors::InvalidEmailFormat < StandardError
  def message
    'Invalid email format'
  end
end
