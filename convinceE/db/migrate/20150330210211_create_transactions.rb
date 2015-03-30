class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float "ammount"
      t.integer "user_id"
      t.string "paypal_token"
      t.timestamps null: false
    end
    add_index :transactions, :user_id
  end
end