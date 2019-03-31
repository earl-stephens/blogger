class CommentsController < ApplicationController
  def create
    # binding.pry
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.save
    @article.comments << @comment
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)

  end

end
