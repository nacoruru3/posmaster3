class MenuController < ApplicationController
	before_filter :authenticate_user!
	def indexcurrents
		@currents = current_user.currents.all
		
	end
	
	def indexitems
		sql = "SELECT items.code,items.cost,items.kban,items.name,items.price,items.price2,items.price3,items.price4,items.sho1bun,zaikos.value,items.id,items.user_id FROM items LEFT JOIN zaikos ON items.code = zaikos.code WHERE items.user_id=" + current_user.id.to_s
		@items = current_user.items.find_by_sql(sql)
	end
	
	def indexsaleshead
		@salesheads = current_user.salesheads.find(:all,:order => "billno DESC" )
	end
	
	def indexabc
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
     $sort = params[:sort]
	 @abcs = current_user.abcs.order("value DESC")
	end
	
	def indextokuis
		@tokuis = current_user.tokuis.all	
	end
	
	def indexsho1buns
		@sho1buns = current_user.sho1buns.all
	end
	
	def indexzaiko
		@Zaiko = current_user.zaikos.find(:all,:include => [:item])
	end
end
