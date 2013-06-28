class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		$username = current_user.username
  	end
  end
end
