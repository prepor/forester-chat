# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090402224031) do

  create_table "crews", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.integer  "version_id"
    t.integer  "status",     :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "text"
    t.integer  "player_id"
    t.integer  "crew_id"
    t.string   "vis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "crew_id"
    t.string   "name"
    t.boolean  "staff",      :default => false
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "versions", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "status",     :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
