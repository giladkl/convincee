class MessageController < ApplicationController
  def index

  	#--------	checking if user is in the game -------
#  	user = User.find(session[:user_id])
# 	@game_id = params[:game_id]
#  	if Game.game_with_user(user.id).id != @game_id
# 		redirect_to root_url
#   end
 	#-------------------------------------------------
  	
  	#-------for testing --------
 	@game_id = 1
 	user = User.find(session[:user_id])
 	#---------------------------
  	@messages = Message.messages_from_game(@game_id)
  	if @messages == nil
  		@messages = []
  	end
  end

  def send_message

  	#user_id = session[:user_id]
  	#game_id = params[:game_id]

  	#assumptions
  	user_id = 3
  	game_id = 1

  	#get message and vars
  	message_text = params[:message]
  	user = User.find(user_id)
	game = Game.find(game_id)

  	message = Message.new
  	message.message = message_text
  	message.user = user
  	message.game = game
  	message.save

  	redirect_to(:action => "index")
  end

  private

	  def message_params
	      # same as using "params[:subject]", except that it:
	      # - raises an error if :subject is not present
	      # - allows listed attributes to be mass-assigned
	      params.require(:message)
	  end
end
