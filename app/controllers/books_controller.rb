class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
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
    @rating = @book.ratings.find_or_initialize_by(user: current_user)
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :image)
  end
end
