class Sho1bunsController < ApplicationController
  # GET /sho1buns
  # GET /sho1buns.json
  def index
    @sho1buns = current_user.sho1buns.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sho1buns }
    end
  end

  # GET /sho1buns/1
  # GET /sho1buns/1.json
  def show
    @sho1bun = current_user.sho1buns.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sho1bun }
    end
  end

  # GET /sho1buns/new
  # GET /sho1buns/new.json
  def new
    @sho1bun = Sho1bun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sho1bun }
    end
  end

  # GET /sho1buns/1/edit
  def edit
    @sho1bun = Sho1bun.find(params[:id])
  end

  # POST /sho1buns
  # POST /sho1buns.json
  def create
    @sho1bun = Sho1bun.new(params[:sho1bun])

    respond_to do |format|
      if @sho1bun.save
        format.html { redirect_to @sho1bun, notice: 'Sho1bun was successfully created.' }
        format.json { render json: @sho1bun, status: :created, location: @sho1bun }
      else
        format.html { render action: "new" }
        format.json { render json: @sho1bun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sho1buns/1
  # PUT /sho1buns/1.json
  def update
    @sho1bun = Sho1bun.find(params[:id])

    respond_to do |format|
      if @sho1bun.update_attributes(params[:sho1bun])
        format.html { redirect_to @sho1bun, notice: 'Sho1bun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sho1bun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sho1buns/1
  # DELETE /sho1buns/1.json
  def destroy
    @sho1bun = Sho1bun.find(params[:id])
    @sho1bun.destroy

    respond_to do |format|
      format.html { redirect_to sho1buns_url }
      format.json { head :no_content }
    end
  end
end
