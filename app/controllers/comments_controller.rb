class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_book, only: [:create, :destroy]

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'Failed to create comment.'
      render 'books/show'
    end
  end

  def destroy
    @comment = @book.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @book, notice: 'Comment was successfully deleted.'
    else
      redirect_to @book, alert: 'You can only delete your own comments.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
