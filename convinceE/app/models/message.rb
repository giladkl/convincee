class Message < ActiveRecord::Base
	belongs_to :game, :foreign_key=>"game_id", class_name: 'Game'
	belongs_to :user , :foreign_key=>"user_id", class_name: 'User'

	scope :messages_from_game, lambda { |game|
    where(:game_id => game).order("updated_at ASC")
    }
end