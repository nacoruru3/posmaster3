# coding: utf-8
class CurrentsController < ApplicationController

	#before_filter :authenticate_user!
  # GET /currents
  # GET /currents.json
  def index
    @currents = current_user.currents.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @currents }
    end
  end

  # GET /currents/1
  # GET /currents/1.json
  def show
    @current = Current.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @current }
    end
  end

  # GET /currents/new
  # GET /currents/new.json
  def new
    @current = Current.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @current }
    end
  end

  # GET /currents/1/edit
  def edit
    @current = Current.find(params[:id])
  end

  # POST /currents
  # POST /currents.json
  def create
    @current = Current.new(params[:current])

    respond_to do |format|
      if @current.save
        format.html { redirect_to @current, notice: 'Current was successfully created.' }
        format.json { render json: @current, status: :created, location: @current }
      else
        format.html { render action: "new" }
        format.json { render json: @current.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /currents/1
  # PUT /currents/1.json
  def update
    @current = Current.find(params[:id])

    respond_to do |format|
      if @current.update_attributes(params[:current])
        format.html { redirect_to @current, notice: 'Current was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @current.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currents/1
  # DELETE /currents/1.json
  def destroy
    @current = Current.find(params[:id])
    @current.destroy

    respond_to do |format|
      format.html { redirect_to currents_url }
      format.json { head :no_content }
    end
  end
end
