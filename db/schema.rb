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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130731174418) do

  create_table "challenges", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "challenge_unit_id"
    t.boolean  "required"
    t.integer  "level"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "phase_id"
    t.integer  "default_week"
    t.integer  "default_day"
  end

  create_table "cohort_events", :force => true do |t|
    t.integer "cohort_id"
    t.integer "event_id"
  end

  create_table "cohorts", :force => true do |t|
    t.string  "name"
    t.string  "year"
    t.date    "start_date"
    t.integer "phase_id"
    t.string  "current_phase_day"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "karma",        :default => 0
    t.text     "body"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "comments", ["challenge_id"], :name => "index_comments_on_challenge_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "event_times", :force => true do |t|
    t.integer  "event_id"
    t.integer  "week"
    t.integer  "day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "phase_events", :force => true do |t|
    t.integer  "phase_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phases", :force => true do |t|
    t.integer  "number"
    t.string   "location"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "challenge_id"
    t.string   "name"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "cohort_id"
    t.boolean  "staff"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
