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
	
	
end
