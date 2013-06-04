class AbcsController < ApplicationController
	before_filter :authenticate_user!
  # GET /abcs
  # GET /abcs.json
  def index
  	abcs = Abc.destroy_all(['user_id = ?',current_user.id])
  	$date = params[:id]
  	@items = current_user.items.all
    @items.each do |item|
     # @salesmei = current_user.salesmeis.find(:all,:conditions => ["itemcode = ? and flg = ? and Date like ?", item.code ,'true',params[:id]+"%"])
      @salesmei = current_user.salesmeis.find(:all,:conditions => ["itemcode = ? and flg = ?", item.code ,'true'])
      unless @salesmei.nil?
      @abc = Abc.new
       @abc.code = item.code
       @abc.name = item.name
       @abc.value = 0
       @abc.user_id = current_user.id
      @salesmei.each do |salesmei|
      @salesheads = current_user.salesheads.find(:all, :conditions => ["billno = ?",salesmei.billno])
      unless @salesheads.nil?
      @salesheads.each do |saleshead|
      	if saleshead.date[0,8] == params[:id]
         @abc.value = @abc.value + salesmei.value
        end
      end
      end
      end
       if @abc.value != 0
      	@abc.save!
       end
      end    	
    end
   # @abcs = Abc.find(:all, :conditions => ["user_id = ?",current_user.id])
   @abcs = current_user.abcs.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abcs }
    end
  end

  # GET /abcs/1
  # GET /abcs/1.json
  def show
    @abc = Abc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @abc }
    end
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
