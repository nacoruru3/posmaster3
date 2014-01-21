class AbcsController < ApplicationController
	before_filter :authenticate_user!
  # GET /abcs
  # GET /abcs.json
  def index
  	abcs = Abc.destroy_all(['user_id = ?',current_user.id])
  	$date = params[:id]
  	@items = current_user.items.all
    @items.each do |item|
    if params[:id] == '99999999'
      @salesmei = current_user.salesmeis.find(:all,:conditions => ["itemcode = ? and flg = ?", item.code ,'true'])
    else
      @salesmei = current_user.salesmeis.find(:all,:conditions => ["itemcode = ? and flg = ? and Date like ?", item.code ,'true',params[:id]+"%"])
    end
      unless @salesmei.nil?
      @abc = Abc.new
       @abc.code = item.code
       @abc.name = item.name
       @abc.value = 0
       @abc.user_id = current_user.id
        @salesmei.each do |salesmei|
         @abc.value = @abc.value + salesmei.value
        end
        if @abc.value != 0
      	 @abc.save!
        end
      end    	
    end
#    @abcs = current_user.abcs.all
   @abcs = current_user.abcs.find(:all, :order => "value DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abcs }
    end
  end

  # GET /abcs/1
  # GET /abcs/1.json
  def show
	$date1 = params[:date1]+"000000"
	$date2 = params[:date2]+"999999"
	abcs = Abc.destroy_all(['user_id = ?',current_user.id])
  	$date = params[:id]
  	$userid = current_user.id
  	@items = current_user.items.all
    @items.each do |item|
    	sql = ["select * from salesmeis where itemcode = ? and to_number(trim(date),'99999999999999') >= to_number(trim(?),'99999999999999') and to_number(trim(date),'99999999999999') <= to_number(trim(?),'99999999999999') and user_id =?",item.code,$date1,$date2,$userid]
    @salesmei = current_user.salesmeis.find_by_sql(sql)
      
      unless @salesmei.nil?
      @abc = Abc.new
       @abc.code = item.code
       @abc.name = item.name
       @abc.value = 0
       @abc.user_id = current_user.id
        @salesmei.each do |salesmei|
         @abc.value = @abc.value + salesmei.value
        end
        if @abc.value != 0
      	 @abc.save!
        end
      end    	
    end
    @abcs = current_user.abcs.all
    # respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @abc }
#     end
  end

  # GET /abcs/new
  # GET /abcs/new.json
  def new
    @abc = Abc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @abc }
    end
  end

  # GET /abcs/1/edit
  def edit
    @abc = Abc.find(params[:id])
  end

  # POST /abcs
  # POST /abcs.json
  def create
    @abc = Abc.new(params[:abc])

    respond_to do |format|
      if @abc.save
        format.html { redirect_to @abc, notice: 'Abc was successfully created.' }
        format.json { render json: @abc, status: :created, location: @abc }
      else
        format.html { render action: "new" }
        format.json { render json: @abc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abcs/1
  # PUT /abcs/1.json
  def update
    @abc = Abc.find(params[:id])

    respond_to do |format|
      if @abc.update_attributes(params[:abc])
        format.html { redirect_to @abc, notice: 'Abc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @abc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abcs/1
  # DELETE /abcs/1.json
  def destroy
    @abc = Abc.find(params[:id])
    @abc.destroy

    respond_to do |format|
      format.html { redirect_to abcs_url }
      format.json { head :no_content }
    end
  end
  

end
