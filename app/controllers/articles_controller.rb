class ArticlesController < ApplicationController
  before_action :set_category
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @categories = Category.all
    @articles = Article.all
    
    case
      when params[:category]
        @articles = Article.where(category_id: params[:category]).page(params[:page]).per(10).latest
      when params[:tag]
        @articles = Article.page.tagged_with(params[:tag]).per(5).latest
      else
        @articles = Article.all
    end
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def create
     @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to category_article_path(@category, @article), notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to category_article_path(@category, @article), notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'Article was Removed.' }
    end
  end
  
  private
  
  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
  
  def set_article
    @article= Article.friendly.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:name, 
                                    :description,
                                    :body,
                                    :link,
                                    :jira_ticket,
                                    :user_id,
                                    :category_id,
                                    :tag_list,
                                    :status
                                  )
  end
  
end
