class Game < ActiveRecord::Base

	belongs_to :convincer1, :foreign_key=>"convincer1_id", class_name: 'User'
	belongs_to :convincer2, :foreign_key=>"convincer2_id", class_name: 'User'

	belongs_to :convincee, :foreign_key=>"convincee_id", class_name: 'User'

	has_many :messages, :foreign_key=>"game_id", class_name: 'Message'
end	

