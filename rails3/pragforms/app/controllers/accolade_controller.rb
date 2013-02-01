#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class AccoladeController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @accolade_pages, @accolades = paginate :accolades, :per_page => 10
  end

  def show
    @accolade = Accolade.find(params[:id])
  end

  def new
    @accolade = Accolade.new
  end

  def create
    @accolade = Accolade.new(params[:accolade])
    if @accolade.save
      flash[:notice] = 'Accolade was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @accolade = Accolade.find(params[:id])
  end

  def update
    @accolade = Accolade.find(params[:id])
    if @accolade.update_attributes(params[:accolade])
      flash[:notice] = 'Accolade was successfully updated.'
      redirect_to :action => 'show', :id => @accolade
    else
      render :action => 'edit'
    end
  end

  def destroy
    Accolade.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
