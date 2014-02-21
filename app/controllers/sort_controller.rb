class SortController < ApplicationController
before_filter :authenticate_user!
  	def sortabc
  	 	
	  	unless params[:sort].nil? 
		  @sort = params[:sort]
		else
		  @sort = 'value'
		end
		if @sort  == session[:sort]
	      if session[:direction] == 'asc'
	       @direction = 'desc'
	      else
	       @direction = 'asc'
	      end
	    else
	      @direction = 'asc'
	    end
  		
  		 @abcs = current_user.abcs.order(@sort+' '+@direction)
  		 session[:sort] = @sort
  		 session[:direction] = @direction
		
	end

end
