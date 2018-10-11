class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_paper_trail_whodunnit
  
  #rescue_from ActiveRecord::RecordNotFound do
    #redirect_back_or root_path
  #end

  def redirect_back_or(path)
    redirect_to request.referer || path,  alert: 'Resource not found.'
  end

end
