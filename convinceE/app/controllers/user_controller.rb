class UserController < ApplicationController
	
	def create_or_login_user
		#Get autorization token
		auth = env['omniauth.auth']
		token = auth.uid

		#Find out if the token exists, if not create a new user
		user = User.find_by token: token
		if user == nil
			#Create new user
			user = User.new
			user.coins = 0
			user.token = token

			#Save user
			user.save
		end

		session[:user_id] = user.id

		#redirect to root
		redirect_to :controller=>"game", :action => "index"

	end
end
