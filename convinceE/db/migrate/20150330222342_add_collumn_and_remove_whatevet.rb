class AddCollumnAndRemoveWhatevet < ActiveRecord::Migration
  def change
  	add_column :games, :convicer1_id, :int
  	add_column :games, :convicer2_id, :int
  end
end
