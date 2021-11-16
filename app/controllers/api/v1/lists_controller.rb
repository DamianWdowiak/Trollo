# frozen_string_literal: true

module Api
  module V1
    class ListsController < ApplicationController
      before_action :set_lists
      before_action :set_list, only: %i[show update destroy]

      def index; end

      def show; end

      def create
        @list = @lists.new(list_params)

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
        params.require(:list).permit(:name, :position)
      end

      def set_list
        @list = @lists.find(params[:id])
      end

      def set_lists
        @lists = current_user.workspaces.find(params[:workspace_id]).boards.find(params[:board_id]).lists
      end
    end
  end
end
