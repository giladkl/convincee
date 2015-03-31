class User < ActiveRecord::Base
	
	has_many :transactions

	has_many :convincer1games, :foreign_key=>"convincer1_id", class_name: 'Game'
	has_many :convincer2games, :foreign_key=>"convincer2_id", class_name: 'Game'
	has_many :winnergames, :foreign_key=>"winner_id", class_name: 'Game' 
	has_many :convinceegames, :foreign_key=>"convincee_id", class_name: 'Game'
	has_many :messages, :foreign_key=>"user_id", class_name: 'Message'

	def convincergames
		self.convincer1games + self.convincer2games
	end

	def games
		self.convincer1games + self.convincer2games + self.convinceegames
	end

	def game_role(game)
		if game.convincee == self
			return "Convincee"
		elsif game.convincer1 == self
			return "Convincer1"
		elsif game.convincer2 = self
			return "Convincer2"
		end
	end
end
