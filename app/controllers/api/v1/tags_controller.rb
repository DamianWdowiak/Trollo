# frozen_string_literal: true

module Api
  module V1
    class TagsController < ApplicationController
      before_action :set_tag, only: %i[update destroy]

      def create
        @tag = Tag.new(tag_params)

        return render json: { errors: @tag.errors.messages }, status: :unprocessable_entity unless @tag.save
      end

      def update
        unless @tag.update(tag_params)
          render json: { errors: @tag.errors.messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @tag.destroy!

        head :no_content
      end

      private

      def tag_params
        params.require(:tag).permit(:name, :color, :board_id)
      end

      def set_tag
        @tag = Tag.find(params[:id])
      end
    end
  end
end
