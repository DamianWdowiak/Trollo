class Api::V1::ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :authenticate_user!
end