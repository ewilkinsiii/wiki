class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_groups, only: [:index]
  
  def index
    if @groups.count == 1
      redirect_to group_path(@groups[0])
    end
  end
  
  def show
    @group = Group.friendly.find(params[:id])
    @categories = @group.categories
    @category_ids = ""
    @categories.each {|category| @category_ids = @category_ids + category.id.to_s + " "}
    @category_id_list = @category_ids.gsub(/\s+/m, ' ').strip.split(" ").map(&:to_i)
    @recent_articles = Article.where(category_id: @category_id_list).order(created_at: :desc).limit(5) 
    @popular_articles = Article.where(category_id: @category_id_list).order(impressions_count: :desc).limit(5)
  end
  
  private
  
  def set_groups
    @groups = current_user.groups
  end
end
