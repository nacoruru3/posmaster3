class SalesheadsController < ApplicationController
before_filter :authenticate_user!
  # GET /salesheads
  # GET /salesheads.json
  def index
    @salesheads = current_user.salesheads.find(:all,:order => "billno DESC" )
    #@salesheads = Saleshead.where(:custno => 1001)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end

  # GET /salesheads/1
  # GET /salesheads/1.json
  def show
    @salesheads = current_user.salesheads.find(:all, :conditions => ["Date like ?", params[:id]+"%"])
   $salesday=params[:id]
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end
######################################
def serchmei
   @salesheads = current_user.salesheads.find(:all, :conditions => ["Date like ?", params[:id]+"%"])
   #@Salesmei=Salesmei.find(:all,:conditions => { :billno => [@salesheads[0].billno ,@salesheads[1].billno]}) 
   @salesbillno=[]
   @salesheads.each do |saleshead|
	   @salesbillno.push(saleshead.billno)
   end
   $day = params[:id]
   @Salesmei=current_user.salesmeis.find(:all,:conditions => { :billno => [@salesbillno]})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end
######################################
def serchhead
	$date1 = params[:date1]+"000000"
	$date2 = params[:date2]+"999999"
	$salesday = params[:date1]+"~"+params[:date2]
	sql = ["select * from salesheads where to_number(trim(date),'99999999999999') >= to_number(trim(?),'99999999999999') and to_number(trim(date),'99999999999999') <= to_number(trim(?),'99999999999999')",$date1,$date2]
    @salesheads = current_user.salesheads.find_by_sql(sql)
end
######################################  
def serchdayoutlet
   @salesheads = current_user.salesheads.find(:all, :conditions => ["Date like ? and outlet = ?" , params[:id]+"%",params[:id2]])
   $salesday=params[:id]
   $outlet=params[:id2]
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end
######################################  

  # GET /salesheads/new
  # GET /salesheads/new.json
  def new
    @saleshead = Saleshead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saleshead }
    end
  end

  # GET /salesheads/1/edit
  def edit
    @saleshead = Saleshead.find(params[:id])
  end

  # POST /salesheads
  # POST /salesheads.json
  def create
    @saleshead = Saleshead.new(params[:saleshead])
    if @saleshead.billno[0,1] == '3'
    @saleshead.outlet = '002'
    else
    @saleshead.outlet = '003'
    end
    respond_to do |format|
      if @saleshead.save
        format.html { redirect_to @saleshead, notice: 'Saleshead was successfully created.' }
        format.json { render json: @saleshead, status: :created, location: @saleshead }
      else
        format.html { render action: "new" }
        format.json { render json: @saleshead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salesheads/1
  # PUT /salesheads/1.json
  def update
    @saleshead = Saleshead.find(params[:id])

    respond_to do |format|
      if @saleshead.update_attributes(params[:saleshead])
        format.html { redirect_to @saleshead, notice: 'Saleshead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saleshead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salesheads/1
  # DELETE /salesheads/1.json
  def destroy
    @saleshead = Saleshead.find(params[:id])
    @saleshead.destroy

    respond_to do |format|
      format.html { redirect_to salesheads_url }
      format.json { head :no_content }
    end
  end
end
