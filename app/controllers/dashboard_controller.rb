class DashboardController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in

  def index
    # Fetch only books belonging to the current user
    @books = current_user.books.includes(:user)

    # Apply search filter if present
    if params[:search].present?
      search_query = params[:search].downcase
      @books = @books.where('lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search_query}%", "%#{search_query}%")
    end
  end
end
