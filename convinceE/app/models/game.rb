class Game < ActiveRecord::Base

	belongs_to :convincer1, :foreign_key=>"convincer1_id", class_name: 'User'
	belongs_to :convincer2, :foreign_key=>"convincer2_id", class_name: 'User'
    belongs_to :winner, :foreign_key=>"winner_id", class_name: 'User'
	belongs_to :convincee, :foreign_key=>"convincee_id", class_name: 'User'

	has_many :messages, :foreign_key=>"game_id", class_name: 'Message'

	scope :games_available_for_convincer, lambda { 
    where(["convincer1_id IS NULL OR convincer2_id IS NULL"])
    }

    scope :games_available_for_convincee, lambda { 
    where(["convincee_id IS NULL"])
    }

    scope :game_with_user, lambda { |user_id|
    where("convincer1_id = ? OR convincer2_id = ? OR convincee_id = ? AND status!=2", user_id, user_id, user_id).order("updated_at ASC").first
    }


    def add_convincer(user)
    	if self.convincer1 == nil
    		self.convincer1 = user
    	elsif self.convincer2 == nil
    		self.convincer2 = user	
    	end
    end



end	

