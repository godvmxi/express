#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class ArticlesController < ApplicationController

  before_filter :load_article, :except => [:index, :new, :create]

  # respond to /articles, method = GET
  def index
    @articles = Article.find(:all)
  end

  # respond to /articles/new, method = GET
  def new
    @article = Article.new
  end

  # respond to /articles, method = POST
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to article_url(@article)
    else
      render :action => :new
    end
  end

  # respond to /articles/id, method = GET -- no code in controller
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @article.to_xml }
      format.yaml { render :xml => @article.to_yaml }
    end
    end

  # /article/id;edit -- no code in controller
  # def edit; end

  # /article/id, method = PUT
  def update
    if @article.update_attributes(params[:article])
      redirect_to article_url(@article)
    else  
      render :action => :edit
    end
  end

  # /article/id, method = DELETE
  def destroy
    @article.destroy
    redirect_to articles_url
  end

private
  
  def load_article
    @article = Article.find(params[:id])
  end
end
