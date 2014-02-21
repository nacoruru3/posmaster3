class ZaikosController < ApplicationController
before_filter :authenticate_user!
  # GET /zaikos
  # GET /zaikos.json
  def index
    #@zaikos = Zaiko.all

    #@zaikos = current_user.zaikos.find(:all,:include => [:item])
    sql = "SELECT zaikos.id,zaikos.code,zaikos.value,zaikos.updated_at,items.cost,items.kban,items.name FROM zaikos LEFT JOIN items ON zaikos.code = items.code WHERE zaikos.user_id=" + current_user.id.to_s + " ORDER BY zaikos.updated_at DESC"
    @zaikos = current_user.zaikos.find_by_sql(sql)
	
     respond_to do |format|
    
      format.html # index.html.erb
      format.json { render json: @zaikos }
    end

  end

  # GET /zaikos/1
  # GET /zaikos/1.json
  def show
    #@zaiko = Zaiko.find(params[:id])
	@zaiko = current_user.zaikos.find(:first,:conditions => ["code = ?",params[:code]])
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
    @zaiko.value = params[:zaiko][:value] 
 	@zaiko.save!

    respond_to do |format|
        @zaikos=Zaiko.find(:all,:include => [:item])
        format.html { redirect_to zaikos_url }
        format.json { head :no_content }
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
