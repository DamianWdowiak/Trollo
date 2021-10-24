# frozen_string_literal: true

module Api
  module V1
    class FirstsController < ApplicationController
      def index
        render json: { output: params[:input].reverse }, status: :ok
      end
    end
  end
end
