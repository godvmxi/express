class ContactersController < ApplicationController
  # GET /contacters
  # GET /contacters.json
  def index
    @contacters = Contacter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacters }
    end
  end

  # GET /contacters/1
  # GET /contacters/1.json
  def show
    @contacter = Contacter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contacter }
    end
  end

  # GET /contacters/new
  # GET /contacters/new.json
  def new
    @contacter = Contacter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contacter }
    end
  end

  # GET /contacters/1/edit
  def edit
    @contacter = Contacter.find(params[:id])
  end

  # POST /contacters
  # POST /contacters.json
  def create
    @contacter = Contacter.new(params[:contacter])

    respond_to do |format|
      if @contacter.save
        format.html { redirect_to @contacter, notice: 'Contacter was successfully created.' }
        format.json { render json: @contacter, status: :created, location: @contacter }
      else
        format.html { render action: "new" }
        format.json { render json: @contacter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacters/1
  # PUT /contacters/1.json
  def update
    @contacter = Contacter.find(params[:id])

    respond_to do |format|
      if @contacter.update_attributes(params[:contacter])
        format.html { redirect_to @contacter, notice: 'Contacter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contacter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacters/1
  # DELETE /contacters/1.json
  def destroy
    @contacter = Contacter.find(params[:id])
    @contacter.destroy

    respond_to do |format|
      format.html { redirect_to contacters_url }
      format.json { head :no_content }
    end
  end
end
