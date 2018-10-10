class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def article
    @articles = Article.where(user_id: current_user.id)
  end
end
