class CategoriesController < ApplicationController
  before_action :set_group
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorization, except: [:search, :autocomplete]
  before_action :authenticate_user!
  access user: {except: [:destroy]}, editor: :all, admin: :all
  
  def search
     search = params[:search].present? ? params[:search] : nil
     conditions = {}
     conditions[:category_id] = params[:category_id] if params[:category_id]
    #@articles = Article.page.where('name ILIKE ? OR description ILIKE ? OR body ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ).per(5).latest 
    @articles = Article.search( search, boost_where:  conditions , page: params[:page], per_page: 5)
    @category = Category.find(params[:category_id])
  end

  def autocomplete
    render json: Article.search(params[:query], {
      fields: ["name", "description", "body"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end
  

  def show
    @id = @category.id
    @root = Article.where(root: 1).where(category_id: @id).take(1)
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).page(params[:page]).per(5)
    else
     @articles = Article.where(category_id: @id).page(params[:page]).per(5)
    end
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
