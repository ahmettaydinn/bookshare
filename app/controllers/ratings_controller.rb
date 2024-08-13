class RatingsController < ApplicationController
  before_action :set_book
  before_action :set_rating, only: [:update]

  def create
    @rating = @book.ratings.find_or_initialize_by(user: current_user)
    @rating.assign_attributes(rating_params)

    if @rating.save
      redirect_to @book, notice: 'Rating was successfully submitted.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def update
    if @rating.update(rating_params)
      redirect_to @book, notice: 'Rating was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_rating
    if action_name == 'create'
      @rating = @book.ratings.find_or_initialize_by(user: current_user)
    elsif action_name == 'update'
      @rating = @book.ratings.find(params[:id])
    end
  end

  def set_rating
    @rating = @book.ratings.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
