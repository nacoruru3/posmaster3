class TokuisController < ApplicationController
  # GET /tokuis
  # GET /tokuis.json
  def index
    @tokuis = current_user.tokuis.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tokuis }
    end
  end

  # GET /tokuis/1
  # GET /tokuis/1.json
  def show
    @tokui = Tokui.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tokui }
    end
  end

  # GET /tokuis/new
  # GET /tokuis/new.json
  def new
    @tokui = Tokui.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tokui }
    end
  end

  # GET /tokuis/1/edit
  def edit
    @tokui = Tokui.find(params[:id])
  end

  # POST /tokuis
  # POST /tokuis.json
  def create
    @tokui = Tokui.new(params[:tokui])
    @tokui.user_id = current_user.id

    respond_to do |format|
      if @tokui.save
        format.html { redirect_to @tokui, notice: 'Tokui was successfully created.' }
        format.json { render json: @tokui, status: :created, location: @tokui }
      else
        format.html { render action: "new" }
        format.json { render json: @tokui.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tokuis/1
  # PUT /tokuis/1.json
  def update
    @tokui = Tokui.find(params[:id])

    respond_to do |format|
      if @tokui.update_attributes(params[:tokui])
        format.html { redirect_to @tokui, notice: 'Tokui was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tokui.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokuis/1
  # DELETE /tokuis/1.json
  def destroy
    @tokui = Tokui.find(params[:id])
    @tokui.destroy

    respond_to do |format|
      format.html { redirect_to tokuis_url }
      format.json { head :no_content }
    end
  end
end
