class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  
  def search
    if params[:search]
      @articles = Article.page.where('name ILIKE ?', "%" + params[:search] + "%" ).where(user_id: current_user.id).per(5).latest
    end 
  end
  
  def article
    @articles = Article.page.where(user_id: current_user.id).per(5)
  end
  
  def set_group
    @group = Group.friendly.find(params[:group_id])
  end
end
