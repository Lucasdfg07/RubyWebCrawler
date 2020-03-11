require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  # Token Authentication
  acts_as_token_authentication_handler_for User

  respond_to :html
  protect_from_forgery with: :exception

end
