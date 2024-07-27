class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :create_comment, :destroy_comment]
  before_action :set_book, only: [:show, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = @book.user
    @comment = Comment.new
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  def create_comment
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'Failed to create comment.'
      render :show
    end
  end

  def destroy_comment
    @book = Book.find(params[:book_id])
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
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :image)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
