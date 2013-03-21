class ZaikosController < ApplicationController
before_filter :authenticate_user!
  # GET /zaikos
  # GET /zaikos.json
  def index
    #@zaikos = Zaiko.all

    @Zaiko = Zaiko.find(:all,:include => [:item])
     respond_to do |format|
    
      format.html # index.html.erb
      format.json { render json: @items }
    end

  end

  # GET /zaikos/1
  # GET /zaikos/1.json
  def show
    @zaiko = Zaiko.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zaiko }
    end
  end

  # GET /zaikos/new
  # GET /zaikos/new.json
  def new
    @zaiko = Zaiko.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zaiko }
    end
  end

  # GET /zaikos/1/edit
  def edit
    @zaiko = Zaiko.find(params[:id])
  end

  # POST /zaikos
  # POST /zaikos.json
  def create
    @zaiko = Zaiko.new(params[:zaiko])

    respond_to do |format|
      if @zaiko.save
        format.html { redirect_to @zaiko, notice: 'Zaiko was successfully created.' }
        format.json { render json: @zaiko, status: :created, location: @zaiko }
      else
        format.html { render action: "new" }
        format.json { render json: @zaiko.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zaikos/1
  # PUT /zaikos/1.json
  def update
    @zaiko = Zaiko.find(params[:id])

    respond_to do |format|
      if @zaiko.update_attributes(params[:zaiko])
        #format.html { redirect_to @zaiko, notice: 'Zaiko was successfully updated.' }
        @Zaiko=Zaiko.find(:all,:include => [:item])
        format.html { redirect_to zaikos_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zaiko.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zaikos/1
  # DELETE /zaikos/1.json
  def destroy
    @zaiko = Zaiko.find(params[:id])
    @zaiko.destroy

    respond_to do |format|
      format.html { redirect_to zaikos_url }
      format.json { head :no_content }
    end
  end
end
