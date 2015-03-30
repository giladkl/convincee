class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.float "amount"
      t.integer "convincers_id"
      t.integer "convincee_id"
      t.integer "winner_id"
      t.timestamps null: false


    end
    add_index :games, :convincers_id
    add_index :games, :convincee_id
    add_index :games, :winner_id
  end
end
