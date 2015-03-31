class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string "message"
      t.integer "game_id"
      t.integer "user_id"
      t.timestamps null: false
    end
    add_index :messages, :game_id
    add_index :messages, :user_id
  end
end
