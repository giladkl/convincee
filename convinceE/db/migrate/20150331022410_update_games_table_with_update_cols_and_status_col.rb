class UpdateGamesTableWithUpdateColsAndStatusCol < ActiveRecord::Migration
  def change
  	add_column :games, :lastupdatec1, :timestamp
  	add_column :games, :lastupdatec2, :timestamp
  	add_column :games, :lastupdatece, :timestamp
  	add_column :games, :status, :int

  end
end
