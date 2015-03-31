class Message < ActiveRecord::Base
	belongs_to :game, :foreign_key=>"game_id", class_name: 'Game'
	belongs_to :user , :foreign_key=>"user_id", class_name: 'User'
end



