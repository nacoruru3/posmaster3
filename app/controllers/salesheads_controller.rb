class SalesheadsController < ApplicationController
before_filter :authenticate_user!
  # GET /salesheads
  # GET /salesheads.json
  def index
    @salesheads = Saleshead.find(:all,:order => "billno DESC" )
    #@salesheads = Saleshead.where(:custno => 1001)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end

  # GET /salesheads/1
  # GET /salesheads/1.json
  def show
   @salesheads = Saleshead.find(:all, :conditions => ["Date like ?", params[:id]+"%"])
   $salesday=params[:id]
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
  end
######################################
def serchmei
   @salesheads = Saleshead.find(:all, :conditions => ["Date like ?", params[:id]+"%"])
   #@Salesmei=Salesmei.find(:all,:conditions => { :billno => [@salesheads[0].billno ,@salesheads[1].billno]}) 
   @salesbillno=[]
   @salesheads.each do |saleshead|
	   @salesbillno.push(saleshead.billno)
   end
   @Salesmei=Salesmei.find(:all,:conditions => { :billno => [@salesbillno]})
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
