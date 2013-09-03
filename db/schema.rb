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

ActiveRecord::Schema.define(:version => 20130626183500) do

  create_table "assignments", :force => true do |t|
    t.integer  "assignable_id"
    t.string   "assignable_type"
    t.integer  "room_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "banks", :force => true do |t|
    t.integer  "room_id"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "auth_attribute"
    t.string   "auth_value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "internal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "comment"
  end

  add_index "posts", ["room_id"], :name => "room_id"
  add_index "posts", ["user_id"], :name => "user_id"

  create_table "questions", :force => true do |t|
    t.integer  "bank_id"
    t.text     "content"
    t.integer  "sequence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "notes"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "prompt"
    t.boolean  "open"
    t.boolean  "autoclear"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.boolean  "administrator"
    t.string   "name"
    t.string   "email_address"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "internal"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
