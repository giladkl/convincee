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
 	user = User.find(1)
 	#---------------------------
  	@messages = Message.messages_from_game(@game_id)
  	if @messages == nil
  		@messages = []
  	end
  end

  def send_message

  	user_id = session[:user_id]
  	#game_id = params[:game_id]
  	#assumptions
  	#user_id = 3
  	game_id = 1

  	#get message and vars
  	message_text = params[:message]
  	user = User.find(user_id)
	  game = Game.find(game_id)

    #Save the messages
  	message = Message.new
  	message.message = message_text
  	message.user = user
  	message.game = game
  	message.save

  	redirect_to(:action => "index")
  end

  def win
    #stautus 2 means game is done
    #input_winner = params[:winner]

    #assumptions
    game_id = 2
    input_winner = 1

    game = Game.find(game_id)

    #if convincer1 won
    if input_winner == 1
      winner = game.convincer1
      loser = game.convincer2
    elsif input_winner == 2
      winner = game.convincer2
      loser = game.convincer1
    end

    if winner!=nil
      game.winner = winner
      winner.coins += (game.amount/2)
      loser.coins -= (game.amount/2)
      game.status = 2
    end

    redirect_to root_url
  end

  private

	  def message_params
	      # same as using "params[:subject]", except that it:
	      # - raises an error if :subject is not present
	      # - allows listed attributes to be mass-assigned
	      params.require(:message)
	  end
end
