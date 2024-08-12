class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_books = current_user.favorite_books
  end

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book: book)

    if favorite.save
      redirect_to book, notice: 'Book was successfully added to your favorites.'
    else
      redirect_to book, alert: favorite.errors.full_messages.to_sentence
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book: book)
    favorite.destroy if favorite

    redirect_to book, notice: 'Book was successfully removed from your favorites.'
  end
end
