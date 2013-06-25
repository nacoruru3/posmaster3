class ZaikoLogsController < ApplicationController
  # GET /zaiko_logs
  # GET /zaiko_logs.json
  def index
    @zaiko_logs = ZaikoLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zaiko_logs }
    end
  end

  # GET /zaiko_logs/1
  # GET /zaiko_logs/1.json
  def show
    @zaiko_log = ZaikoLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zaiko_log }
    end
  end

  # GET /zaiko_logs/new
  # GET /zaiko_logs/new.json
  def new
    @zaiko_log = ZaikoLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zaiko_log }
    end
  end

  # GET /zaiko_logs/1/edit
  def edit
    @zaiko_log = ZaikoLog.find(params[:id])
  end

  # POST /zaiko_logs
  # POST /zaiko_logs.json
  def create
    @zaiko_log = ZaikoLog.new(params[:zaiko_log])

    respond_to do |format|
      if @zaiko_log.save
        format.html { redirect_to @zaiko_log, notice: 'Zaiko log was successfully created.' }
        format.json { render json: @zaiko_log, status: :created, location: @zaiko_log }
      else
        format.html { render action: "new" }
        format.json { render json: @zaiko_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zaiko_logs/1
  # PUT /zaiko_logs/1.json
  def update
    @zaiko_log = ZaikoLog.find(params[:id])

    respond_to do |format|
      if @zaiko_log.update_attributes(params[:zaiko_log])
        format.html { redirect_to @zaiko_log, notice: 'Zaiko log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zaiko_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zaiko_logs/1
  # DELETE /zaiko_logs/1.json
  def destroy
    @zaiko_log = ZaikoLog.find(params[:id])
    @zaiko_log.destroy

    respond_to do |format|
      format.html { redirect_to zaiko_logs_url }
      format.json { head :no_content }
    end
  end
end
