class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @articles = Article.all
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
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
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
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was Removed.' }
    end
  end
  
  private
  
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
