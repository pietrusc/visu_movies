# frozen_string_literal: true

class CustomersController < ApplicationController
  def sign_into_newsletter
    results = SignIntoNewsletter.new(email_param).call
    render json: CustomerSerializer.new(results).serialized_json
  rescue StandardError => e
    render json: { error: e.message, status: 400 }, status: :bad_request
  end

  private

  def email_param
    params.from_jsonapi.require(:customer).require(:email)
  end
end
