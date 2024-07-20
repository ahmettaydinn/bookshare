class DashboardController < ApplicationController
  def index
    @books = Book.includes(:user) # Load all books with their associated users

    if params[:search].present?
      search_query = params[:search].downcase
      @books = @books.where('lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search_query}%", "%#{search_query}%")
    end
  end
end
