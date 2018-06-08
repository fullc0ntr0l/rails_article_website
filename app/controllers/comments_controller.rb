# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    redirect_to article_path(@article)
  end
end
