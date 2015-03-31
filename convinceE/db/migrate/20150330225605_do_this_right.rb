class DoThisRight < ActiveRecord::Migration
  def change
  	add_column :games, :convincer1_id, :int
  	add_column :games, :convincer2_id, :int
  end
end
