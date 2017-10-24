class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    puts comment_params
    if comments = Comment.where(comment_params)
      render json: comments
    else
      render json: "No comments found", status: 404
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      render json: comment
    else
      render json: "No comments found", status: 404
    end
  end



  private

    def comment_params
      params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
