# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController
      include ActionController::MimeResponds

      before_action :authenticate_user!
    end
  end
end
