class DashboardController < ApplicationController
  def index
    @books = Book.includes(:user).where.not(users: { id: current_user.id })
  end
end
