class ArticlesController < ApplicationController
  before_action :set_group
  before_action :set_category
  before_action :set_paper_trail_whodunnit
  before_action :set_article, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :set_topic, only: [:search]
  before_action :authenticate_user!
  impressionist actions: [:show], unique: [:session_hash]
  
  def search
    if params[:search]
      @articles = Article.page.where('name ILIKE ?', "%" + params[:search] + "%" ).where(category_id: @category.id).per(5).latest
    end 
  end
  
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
    @article = Article.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    impressionist(@article, "message...")
    @versions =@article.versions.order('created_at DESC')
  end
  
  def new
    @article = Article.new
  end
  
  def create
     @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to group_category_article_path(@group, @category, @article), notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @versions =@article.versions.order('created_at DESC')
  end
  
  def update
    @following = @article.votes_for.up.by_type(User).voters
    respond_to do |format|
      if @article.update(article_params)
        @following.each do |f|
          notifier = Slack::Notifier.new f.slackurl 
          @user = User.find(@article.versions.last.whodunnit)
          @message = "
          The article:  #{@article.name} 
          was updated by: #{@user.name}
          click [here](http://localhost:3000#{group_category_article_path(@group, @category, @article)}) to view the article
          "
          notifier.ping Slack::Notifier::Util::LinkFormatter.format(@message)
        end
        format.html { redirect_to group_category_article_path(@group, @category, @article), notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to group_category_path(@group, @category), notice: 'Article was Removed.' }
    end
  end
  
  def deleted
    @articles = Version.where(event: 'destroy')
  end
  
  def follow 
    @article.upvote_by current_user
    redirect_to :back
  end  

  def unfollow
    @article.downvote_by current_user
    redirect_to :back
  end
  
  private
  
  def set_group
    @group = Group.friendly.find(params[:group_id])
  end
  
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
                                    :status,
                                    article_uploads_attributes: [:id, :attachment, :_destroy]
                                  )
  end
  
  def set_topic
    @topics= Topic.with_articles
  end
  
end
