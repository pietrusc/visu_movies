# frozen_string_literal: true

class SignIntoNewsletter
  def initialize(email)
    @email = email
  end

  def call
    raise Errors::InvalidEmailFormat unless @email.match(URI::MailTo::EMAIL_REGEXP)

    Customer.where(email: @email).first_or_create!
  end
end
