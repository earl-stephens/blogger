class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article #{@article.title} has been created."
    redirect_to article_path(@article)
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)
    flash.notice = "Article #{@article.title} was updated."
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "The article has been deleted."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
