class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from StandardError, with: :standard_error
  
    private
  
    def record_not_found
      flash[:alert] = 'Record not found.'
      redirect_to root_path
    end
  
    def standard_error(exception)
      # Log the error for debugging
      Rails.logger.error(exception.message)
      Rails.logger.error(exception.backtrace.join("\n"))
  
      flash[:alert] = 'An unexpected error occurred. Please try again later.'
      redirect_to root_path
    end
  end
  