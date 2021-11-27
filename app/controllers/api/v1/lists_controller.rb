# frozen_string_literal: true

module Api
  module V1
    class ListsController < ApplicationController
      before_action :set_list, only: %i[show update destroy]

      def show; end

      def create
        position = Board.find(list_params[:board_id]).lists.size
        @list = List.new(list_params.merge({ position: position }))

        return render json: { errors: @list.errors.messages }, status: :unprocessable_entity unless @list.save
      end

      def update
        unless @list.update(list_params)
          render json: { errors: @list.errors.messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @list.destroy!

        head :no_content
      end

      private

      def list_params
        params.require(:list).permit(:name, :position, :board_id)
      end

      def set_list
        @list = List.find(params[:id])
      end
    end
  end
end
