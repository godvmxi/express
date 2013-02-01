#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class ZipController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @zip_pages, @zips = paginate :zips, :per_page => 10
  end

  def show
    @zip = Zip.find(params[:id])
  end

  def new
    @zip = Zip.new
  end

  def create
    @zip = Zip.new(params[:zip])
    if @zip.save
      flash[:notice] = 'Zip was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @zip = Zip.find(params[:id])
  end

  def update
    @zip = Zip.find(params[:id])
    if @zip.update_attributes(params[:zip])
      flash[:notice] = 'Zip was successfully updated.'
      redirect_to :action => 'show', :id => @zip
    else
      render :action => 'edit'
    end
  end

  def destroy
    Zip.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def lookup_ajax
    do_lookup
    render :partial=>"lookup"
  end
  
  def lookup
    do_lookup
    render :layout=>false
  end

  def raw_before
    @zip = Zip.new
  end

  def raw_demo
    @zip = Zip.new
    render :layout=>false
  end

  def prototype_before
    @zip = Zip.new
    render :layout=>false
  end

  def prototype_demo
    @zip = Zip.new
    render :layout=>false
  end
  
  def scriptaculous_before
    render :layout=>false
  end  

  def scriptaculous_demo
    render :layout=>false
  end  
  
  private 
  def do_lookup
    # enable either zip= or zip[zip]= query strings
    zip = params[:zip]
    zip = zip[:zip] if zip.kind_of? Hash
    @zip = Zip.find_by_zip(zip)
    @zip = Zip.new({:zip=>zip}) unless @zip
  end
end
