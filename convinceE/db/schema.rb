# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150331022410) do

  create_table "games", force: :cascade do |t|
    t.float    "amount"
    t.integer  "convincee_id"
    t.integer  "winner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "convincer1_id"
    t.integer  "convincer2_id"
    t.datetime "lastupdatec1"
    t.datetime "lastupdatec2"
    t.datetime "lastupdatece"
    t.integer  "status"
  end

  add_index "games", ["convincee_id"], name: "index_games_on_convincee_id"
  add_index "games", ["winner_id"], name: "index_games_on_winner_id"

  create_table "messages", force: :cascade do |t|
    t.string   "message"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["game_id"], name: "index_messages_on_game_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.float    "ammount"
    t.integer  "user_id"
    t.string   "paypal_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.float    "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
