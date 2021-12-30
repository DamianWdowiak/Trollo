# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      before_action :set_card, only: %i[show update destroy upload_file delete_file add_tag delete_tag]

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

      def upload_file
        @card.files.attach(params[:file])

        head :no_content
      end

      def delete_file
        @card.files.find(params[:file_id]).purge_later

        head :no_content
      end

      def add_tag
        tag = @card.list.board.tags.find(params[:tag_id])

        @card.tags << tag

        head :no_content
      end

      def delete_tag
        tag = @card.tags.find(params[:tag_id])
        @card.tags.destroy(tag)

        head :no_content
      end

      private

      def card_params
        params.require(:card).permit(:title, :description, :list_id, :position, files: [])
      end

      def set_card
        @card = Card.find(params[:id])
      end
    end
  end
end
