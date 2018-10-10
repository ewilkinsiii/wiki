class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def search
    if params[:search]
      @articles = Article.page.where('name ILIKE ?', "%" + params[:search] + "%" ).where(category_id: params[:category_id]).per(5).latest
    end 
  end
  
  def index
    @categories = Category.all
    @recent_articles = Article.order(created_at: :desc).limit(5) 
    @popular_articles = Article.order(impressions_count: :desc).limit(5)
    
    case
      when params[:category]
        @categories = Category.where(category_id: params[:category]).page(params[:page]).per(10).latest
      when params[:tag]
        @categories = Category.page.tagged_with(params[:tag]).per(5).latest
      else
        @categories = Category.all
    end
  end
  
  def show
    @id = @category.id
    @articles = Article.where(category_id: @id).page.per(5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
     @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to category_url, notice: 'Category was Removed.' }
    end
  end
  
  private
  
  def set_category
    @category = Category.friendly.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end
