# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]

      def show; end

      def create
        @comment = Comment.new(comment_params)

        return render json: { errors: @comment.errors.messages }, status: :unprocessable_entity unless @comment.save
      end

      def update
        unless @comment.update(comment_params)
          render json: { errors: @comment.errors.messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy!

        head :no_content
      end

      private

      def comment_params
        params.require(:comment).permit(:text, :card_id, :user_id )
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end
