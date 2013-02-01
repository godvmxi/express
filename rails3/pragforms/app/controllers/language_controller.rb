#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class LanguageController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @language_pages, @languages = paginate :languages, :per_page => 10
  end

  def show
    @language = Language.find(params[:id])
  end

  def new
    @language = Language.new
  end

  def validate
    @key = params[:language].keys.first # s/b only 1
    @language = Language.new(params[:language])
    @language.valid?
    if @language.errors[@key]
      render :text=>@language.errors[@key]
    else
      render :nothing=>true, :status=>204
    end
  end
  
  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = 'Language was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(params[:language])
      flash[:notice] = 'Language was successfully updated.'
      redirect_to :action => 'show', :id => @language
    else
      render :action => 'edit'
    end
  end

  def destroy
    Language.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
