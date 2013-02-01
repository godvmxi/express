#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class CommentsController < ApplicationController

  before_filter :find_article

  def new
    @comment = Comment.new
    @article_id = params[:article_id]
  end

  def create
    @comment = Comment.new(params[:comment])
    
    if (@article.comments << @comment)
      redirect_to article_url(@article)
    else
      render :action => :new
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to article_url(@article)
    else
      render :action => :edit
    end
  end

  def destroy
    comment = @article.comments.find(params[:id].to_i)
    @article.comments.delete(comment)
    redirect_to article_url(@article)
  end
  
  private
  
  def find_article
    @article_id = params[:article_id]
    redirect_to articles_url unless @article_id
    @article = Article.find(@article_id)
  end
end
