class VersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_category, except: [:bringback]
  before_action :set_group, except: [:bringback]
  before_action :set_article_and_version, only: [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    article = @version.reify
    article.user_id = current_user.id
    article.save
    redirect_to edit_category_article_path(@category, article)
  end
  
  def bringback
    version = Version.find(params[:id])
    @article = version.reify
    @article.save
    # Let's remove the version since the document is undeleted
    version.delete
    redirect_to root_path, notice: 'The Article was successfully brought back!'
  end

  private

    def set_article_and_version
      @article = Article.friendly.find(params[:article_id])
      @version = @article.versions.find(params[:id])
    end
    
    def set_category
     @category = Category.friendly.find(params[:category_id])
    end
    
    def set_group
     @group = Group.friendly.find(params[:group_id])
    end
end
