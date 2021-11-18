# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      before_action :set_card, only: %i[show update destroy]

      def show; end

      def create
        @card = Card.new(card_params)

        return render json: { errors: @card.errors.messages }, status: :unprocessable_entity unless @card.save
      end

      def update
        unless @card.update(card_params)
          render json: { errors: @card.errors.messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @card.destroy!

        head :no_content
      end

      private

      def card_params
        params.require(:card).permit(:title, :description, :list_id)
      end

      def set_card
        @card = Card.find(params[:id])
      end
    end
  end
end
