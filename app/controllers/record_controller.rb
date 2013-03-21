class RecordController < ApplicationController
	def post
		Current.transaction do
    	currents = Current.destroy_all
    	#@current= Current.new(params[:currerncy])
    	
    	params[:currency].each do |currency|
    	@current = Current.new
  		p currency["Currency"]
  		@current.currency = currency["Currency"]
  		p currency["Code"]
  		@current.code = currency["Code"]
  		p currency["Name"]
  		@current.name = currency["Name"]
  		@current.save!    	
  		end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def itempost
	   Item.transaction do
    	items = Item.destroy_all
    	params[:item].each do |item|
    	@item = Item.new
  		@item.name = item["Name"]
  		@item.code = item["Code"]
  		@item.price = item["Price"]
  		@item.price2 = item["Price2"]
  		@item.price3 = item["Price3"]
  		@item.price4 = item["Price4"]
  		@item.sho1bun = item["Sho1bun"]
  		@item.kban = item["Kban"]
  		if item["Name"] != "EEEE" then
  		@item.save!
  		end
  		#@item = Item.where(:code => zaiko["Code"]).select('id')
  		@zaikoid = Zaiko.where(:code => item["Code"]).select('id')
  		@zaikoid.each do |zaikoid|
    	  @zaiko=Zaiko.find(zaikoid.id)
    	  @itemid = Item.where(:code => item["Code"]).select('id')
    	  @itemid.each do |itemid|
    	   @zaiko.item_id = itemid.id
    	  end
    	  @zaiko.save
    	 end
  	    end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def zaikopost
	   Zaiko.transaction do
    	zaikos = Zaiko.destroy_all
    	params[:zaiko].each do |zaiko|
    	@item = Item.where(:code => zaiko["Code"]).select('id')
    	 @zaiko = Zaiko.new
    	 @item.each do |item|
    	  @zaiko.item_id = item.id
    	 end
  		 @zaiko.name = zaiko["Name"]
  		 @zaiko.code = zaiko["Code"]
  		 @zaiko.value = zaiko["Value"]
  		 if zaiko["Name"] != "EEEE" then
  		  @zaiko.save!
  		 end
  	    end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def tokuipost
	   Tokui.transaction do
    	tokuis = Tokui.destroy_all
    	params[:tokui].each do |tokui|
    	 @tokui = Tokui.new
  		 @tokui.name = tokui["Name"]
  		 @tokui.code = tokui["Code"]
  		 @tokui.tokui1bun = tokui["Tokui1bun"]
  		 if tokui["Name"] != "EEEE" then
  		  @tokui.save!
  		 end
  	    end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def salesheadpost
	   Saleshead.transaction do
    	params[:saleshead].each do |saleshead|
    	 @saleshead = Saleshead.new
  		 @saleshead.billno = saleshead["Billno"]
  		 @saleshead.price = saleshead["Price"]
  		 @saleshead.date = saleshead["Date"]
  		 @saleshead.custno = saleshead["Custno"]
  		 @tokui = Tokui.where(:code => saleshead["Custno"]).select('id')
  		 @tokui.each do |tokui|
    	  @saleshead.tokui_id = tokui.id
    	 end
  		 @saleshead.save!
  	    end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def salesmeipost
	   Salesmei.transaction do
    	params[:salesmei].each do |salesmei|
    	 @salesmei = Salesmei.new
  		 @salesmei.billno = salesmei["Billno"]
  		 if salesmei["Billno"] != "EEEE" then
  		 @saleshead = Saleshead.where(:billno => salesmei["Billno"]).select('id')
  		 @saleshead.each do |saleshead|
  		 	@salesmei.saleshead_id = saleshead.id
  		 end
  		 @salesmei.itemcode = salesmei["Itemcode"]
  		 @item = Item.where(:code => salesmei["Itemcode"]).select('id')
  		 @item.each do |item|
  		    @salesmei.item_id = item.id
  		 end
  		 #@zaikoid = Zaiko.where(:code => salesmei["Itemcode"]).select('id')
  		 #@zaikoid.each do |zaikoid|
  		 #	@zaiko=Zaiko.find(zaikoid.id)
  		 #	@zaiko.value = @zaiko.value - salesmei["Value"]
  		 #end
  		 #@zaiko.save
  		 @salesmei.value = salesmei["Value"]
  		 @salesmei.itemprice = salesmei["Itemprice"]
  		  @salesmei.save!
  		 end
  	    end  
  	  end
  	  render :text => '1'
  	  rescue
  	  
    end
    
    def list
    	@currents = Current.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @currents }
    end
    end
    
    def hasone
     @Zaiko = Zaiko.find(:all,:include => [:item])
     respond_to do |format|
    
      format.html # index.html.erb
      format.json { render json: @items }
    end
    end
    
    def belongs
     @zaiko = Zaiko.find(2487)
    end
    
    def rireki
     @salesheads = Saleshead.where(:custno => params[:id])
    #@salesheads = Saleshead.where(:custno => 1001)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
    end
    
    def rirekitest
     @salesheads = Saleshead.where(:custno => 1001)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salesheads }
    end
    end
    
    def delorder
    	if params[:id]=="99" then
    	 order = Order.destroy_all
    	end
    	render :text => '1'
    end 
    
    def orderpost
     Order.transaction do
    	params[:order].each do |order|
    	@order = Order.new
    	@order.sheet = order["Sheet"]
    	@order.name = order["Name"]
  		@order.code = order["Code"]
  		@order.price = order["Price"]
  		@order.save!
  		end
     end
      render :text => '1'
  	  rescue
    end
    
    def ordersheet
      @order = Order.where(:sheet => params[:id])
      #@order = Order.all
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
    end
    
    
    def searchitem
    	@items = Item.where(:code => params[:id])
    	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @items }
    end
    end  
end
