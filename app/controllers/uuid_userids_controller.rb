class UuidUseridsController < ApplicationController
  # GET /uuid_userids
  # GET /uuid_userids.json
  def index
    @uuid_userids = UuidUserid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uuid_userids }
    end
  end

  # GET /uuid_userids/1
  # GET /uuid_userids/1.json
  def show
    @uuid_userid = UuidUserid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uuid_userid }
    end
  end

  # GET /uuid_userids/new
  # GET /uuid_userids/new.json
  def new
    @uuid_userid = UuidUserid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uuid_userid }
    end
  end

  # GET /uuid_userids/1/edit
  def edit
    @uuid_userid = UuidUserid.find(params[:id])
  end

  # POST /uuid_userids
  # POST /uuid_userids.json
  def create
    @uuid_userid = UuidUserid.new(params[:uuid_userid])

    respond_to do |format|
      if @uuid_userid.save
        format.html { redirect_to @uuid_userid, notice: 'Uuid userid was successfully created.' }
        format.json { render json: @uuid_userid, status: :created, location: @uuid_userid }
      else
        format.html { render action: "new" }
        format.json { render json: @uuid_userid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uuid_userids/1
  # PUT /uuid_userids/1.json
  def update
    @uuid_userid = UuidUserid.find(params[:id])

    respond_to do |format|
      if @uuid_userid.update_attributes(params[:uuid_userid])
        format.html { redirect_to @uuid_userid, notice: 'Uuid userid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @uuid_userid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uuid_userids/1
  # DELETE /uuid_userids/1.json
  def destroy
    @uuid_userid = UuidUserid.find(params[:id])
    @uuid_userid.destroy

    respond_to do |format|
      format.html { redirect_to uuid_userids_url }
      format.json { head :no_content }
    end
  end
end
