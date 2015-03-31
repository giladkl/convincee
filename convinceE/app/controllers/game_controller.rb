class GameController < ApplicationController
	
	def index
	end

	def request_game
		#Get user from session
		user = User.find session[:user_id]

		#Check if user has a pending game, if so, kick him out ;)
		games = user.games
		games.each do |g|
			if g.status!=2
				render :plain=>"0"
				return
			end
		end

		#Get type, then find games available for that type. 0 is convincer, 1 is convincee
		type = params[:type]

		if(type == "0")
			games_available = Game.games_available_for_convincer
		else
			games_available = Game.games_available_for_convincee
		end

		unless games_available.length == 0
			#Set the game to a the first available game (this is also the oldest record!)
			game = games_available[0]
		else
			#Create a new game
			game = Game.new
			game.status = 0
			game.save
		end

		#Register the user to the game
		if(type == "0")
			game.add_convincer(user)
		else 
			game.convincee = user
		end

		#Check if game is done, if so, set status to 1
		if game.convincee != nil && game.convincer1 != nil && game.convincer2 != nil
			#Set status to Running, or 1
			game.status = 1
				
		end

		#Save the game
		game.save

		render :plain=>"1"

	end

	def check_game_status
		#Get user from session
		user = User.find session[:user_id]
		
		#Find a game where the user is involved
		game = Game.game_with_user(user.id)

		#If game is 1, redirect him to message controller
		if game.status == 1
			session[:game_id] = game.id
			render :plain=>"1"
		else
			render :plain=>"0"
		end	

	end

	def knockout_timedout_users
	end

end
