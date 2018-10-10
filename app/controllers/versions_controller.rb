class VersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_article_and_version, only: [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    article = @version.reify
    article.save
    redirect_to edit_category_article_path(@category, @article)
  end

  private

    def set_article_and_version
      @article = Article.friendly.find(params[:article_id])
      @version = @article.versions.find(params[:id])
    end
    
    def set_category
     @category = Category.friendly.find(params[:category_id])
    end
end
