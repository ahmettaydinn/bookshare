class DashboardController < ApplicationController
  def index
    @books = Book.includes(:user).all
  end
end
