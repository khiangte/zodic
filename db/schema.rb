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

ActiveRecord::Schema.define(:version => 20140520092705) do

  create_table "contributors", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["email"], :name => "index_contributors_on_email", :unique => true
  add_index "contributors", ["reset_password_token"], :name => "index_contributors_on_reset_password_token", :unique => true

  create_table "mizoenglishes", :force => true do |t|
    t.string "word"
    t.string "definition"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      :default => false
  end

  create_table "words", :force => true do |t|
    t.string  "word"
    t.string  "thumal"
    t.string  "pos"
    t.string  "meaning"
    t.string  "example"
    t.string  "user"
    t.boolean "active",  :default => false
  end

end
