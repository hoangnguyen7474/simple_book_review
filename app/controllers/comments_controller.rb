class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @comment = @book.comments.new(comment_params)

    if @comment.save
      render status: 200, json:{
        comment: render_to_string( partial: 'comments/comment', locals:{ comment: @comment })
      }
    else
      render status: 404, json: { error: @comment.error.full_message.to_sentence }
    end
  end

  def destroy
    @comment = @book.comments.find_by_id(params[:id])

    if @comment.destroy
      render status: 200, json:{ message: "COMMENT DELETED!"}
    else
      render status: 404, json: { error: @comment.errors.full_message.to_sentence }
    end
  end

  def update
    @comment = @book.comments.find_by_id(params[:id])

    if @comment.update(comment_params)
      render status: 200, json:{
        comment: render_to_string(partial: 'comments/comment', locals: { comment: @comment })
      }
    else
      render status:400, json: { error: @comment.errors.full_message.to_sentence }
    end
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end