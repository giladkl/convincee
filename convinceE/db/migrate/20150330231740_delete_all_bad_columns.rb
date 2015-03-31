class DeleteAllBadColumns < ActiveRecord::Migration
  def change
  	remove_column :games, :convincers_id
  	remove_column :games, :convicer1_id
  	remove_column :games, :convicer2_id



  end
end
