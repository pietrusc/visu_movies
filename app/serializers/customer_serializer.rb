# frozen_string_literal: true

class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
end
