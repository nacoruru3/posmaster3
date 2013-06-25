class AuthenticationTokenController < ApplicationController
	before_filter :authenticate_user!
	
	def show
	
    	current_user.ensure_authentication_token!
    	render :text => current_user.authentication_token	
    end
    
    def user
       render :text => current_user.username
    end
    
    def auth
    	render :text => 1
    end
end
