# frozen_string_literal: true

module Api
  module V1
    class BoardsController < ApplicationController
      before_action :set_boards
      before_action :set_board, only: %i[show update destroy]

      def index; end

      def show; end

      def create
        @board = @boards.new(board_params.merge({ owner: current_user }))

        return render json: { errors: @board.errors.messages }, status: :unprocessable_entity unless @board.save
      end

      def update
        unless @board.update(board_params)
          render json: { errors: @board.errors.messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @board.destroy!

        head :no_content
      end

      private

      def board_params
        params.require(:board).permit(:name, :visibility)
      end

      def set_board
        @board = @boards.find(params[:id])
      end

      def set_boards
        @boards = current_user.workspaces.find(params[:workspace_id]).boards
      end
    end
  end
end
