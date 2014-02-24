class SalesmeisController < ApplicationController
before_filter :authenticate_user!
  # GET /salesmeis
  # GET /salesmeis.json
  def index
    #@salesmeis = Salesmei.all
    @Salesmei = current_user.salesmeis.find(:all,:include => [:item])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Salesmei }
    end
  end
  
  def show
  $userid = current_user.id
    # GET /salesmeis/1
  # GET /salesmeis/1.json
#    @Salesmei = current_user.salesmeis.find(:all,:conditions => ["billno = ? and outlet = ?", params[:id] ,params[:id2]])
	# sql = ["SELECT salesmeis.billno,salesmeis.itemcode,salesmeis.itemname,salesmeis.value,salesmeis.itemprice,salesmeis.flg,zaikos.value FROM salesmeis LEFT JOIN zaikos ON salesmeis.itemcode = zaikos.code WHERE billno = ? and outlet = ? and salesmeis.user_id = ?" ,params[:id],params[:id2],$userid]
	sql = ["SELECT salesmeis.billno,salesmeis.itemcode,salesmeis.itemname,salesmeis.itemprice,salesmeis.flg,salesmeis.value as salesmeisvalue,zaikos.value as zaikosvalue FROM salesmeis LEFT JOIN zaikos ON salesmeis.itemcode = zaikos.code WHERE billno = ? and outlet = ? and salesmeis.user_id = ? and zaikos.user_id = ? " ,params[:id],params[:id2],$userid,$userid]
 	@Salesmei = current_user.salesmeis.find_by_sql(sql)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Salesmei }
    end
  end
  
  def showzaiko
  	$userid = current_user.id
    # GET /salesmeis/1
  # GET /salesmeis/1.json
#    @Salesmei = current_user.salesmeis.find(:all,:conditions => ["billno = ? and outlet = ?", params[:id] ,params[:id2]])
	# sql = ["SELECT salesmeis.billno,salesmeis.itemcode,salesmeis.itemname,salesmeis.value,salesmeis.itemprice,salesmeis.flg,zaikos.value FROM salesmeis LEFT JOIN zaikos ON salesmeis.itemcode = zaikos.code WHERE billno = ? and outlet = ? and salesmeis.user_id = ?" ,params[:id],params[:id2],$userid]
	sql = ["SELECT salesmeis.billno,salesmeis.itemcode,salesmeis.itemname,salesmeis.itemprice,salesmeis.flg,salesmeis.value as salesmeisvalue,zaikos.value as zaikosvalue FROM salesmeis LEFT JOIN zaikos ON salesmeis.itemcode = zaikos.code WHERE billno = ? and outlet = ? and salesmeis.user_id = ? and zaikos.user_id = ?" ,params[:id],params[:id2],$userid,$userid]
 	@Salesmei = current_user.salesmeis.find_by_sql(sql)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Salesmei }
    end
  	
  end

  # GET /salesmeis/1
  # GET /salesmeis/1.json
#  def show
#    @salesmei = Salesmei.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @salesmei }
#    end
#  end

  # GET /salesmeis/new
  # GET /salesmeis/new.json
  def new
    @salesmei = Salesmei.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salesmei }
    end
  end

  # GET /salesmeis/1/edit
  def edit
    @salesmei = Salesmei.find(params[:id])
  end

  # POST /salesmeis
  # POST /salesmeis.json
  def create
    @salesmei = Salesmei.new(params[:salesmei])

    respond_to do |format|
      if @salesmei.save
        format.html { redirect_to @salesmei, notice: 'Salesmei was successfully created.' }
        format.json { render json: @salesmei, status: :created, location: @salesmei }
      else
        format.html { render action: "new" }
        format.json { render json: @salesmei.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salesmeis/1
  # PUT /salesmeis/1.json
  def update
    @salesmei = Salesmei.find(params[:id])

    respond_to do |format|
      if @salesmei.update_attributes(params[:salesmei])
        format.html { redirect_to @salesmei, notice: 'Salesmei was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @salesmei.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salesmeis/1
  # DELETE /salesmeis/1.json
  def destroy
    @salesmei = Salesmei.find(params[:id])
    @salesmei.destroy

    respond_to do |format|
      format.html { redirect_to salesmeis_url }
      format.json { head :no_content }
    end
  end
end
