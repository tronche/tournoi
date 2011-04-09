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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110409133429) do

  create_table "parent_phases", :id => false, :force => true do |t|
    t.integer  "parent_phase_id"
    t.integer  "main_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.text     "description"
    t.integer  "participants"
    t.integer  "qualifies"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phases", ["tournament_id"], :name => "index_phases_on_tournaments_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "game"
    t.string   "support"
    t.string   "conf"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
