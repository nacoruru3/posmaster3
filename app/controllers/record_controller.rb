class RecordController < ApplicationController
	def post
    	currents = Current.destroy_all
    	@current= Current.new(params[:currerncy])
    	
    	params[:currency].each do |currency|
    	@current = Current.new
  		p currency["Currency"]
  		@current.currency = currency["Currency"]
  		p currency["Code"]
  		@current.code = currency["Code"]
  		p currency["Name"]
  		@current.name = currency["Name"]
  		@current.save    	
  		end  
  		respond_to do |format|
  		end
    end
    
    def list
    	@currents = Current.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @currents }
    end
    end
end
