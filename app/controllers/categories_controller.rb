class CategoriesController < ApplicationController
  before_action :set_group
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorization
  before_action :authenticate_user!
  
  def search
    if params[:search]
      @articles = Article.page.where('name ILIKE ?', "%" + params[:search] + "%" ).where('slug ILIKE ?', "%" + params[:search] + "%").per(5).latest 
    end 
  end
  

  def show
    @id = @category.id
    @articles = Article.where(category_id: @id).page(params[:page]).per(5)
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
  
  def authorization
    category = []
    category << @category
    if @group.categories & category == []
      redirect_to @group, notice: 'You dont have permission to view this category.'
    end
  end
  
  def set_group
    @group = Group.friendly.find(params[:group_id])
  end
  
  def set_category
    @category = Category.friendly.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end
