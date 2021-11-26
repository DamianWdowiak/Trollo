# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[current]

      def current; end

      private

      def set_user
        @user = current_user
      end
    end
  end
end
