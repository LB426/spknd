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

ActiveRecord::Schema.define(:version => 20120319171918) do

  create_table "catandrazds", :force => true do |t|
    t.string   "category"
    t.integer  "cat_id"
    t.string   "razdel"
    t.integer  "razd_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "form"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nedvjs", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "pricenote"
  end

  create_table "nedvjsphotos", :force => true do |t|
    t.integer  "nedvj_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "post_comments", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "post_id"
  end

  create_table "postfotos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.string   "pricecomment"
    t.integer  "razdel"
    t.integer  "category"
    t.string   "lat"
    t.string   "lng"
    t.integer  "location_id"
    t.integer  "section_id"
    t.integer  "sub_section_id"
    t.integer  "category_id"
    t.text     "options"
  end

  create_table "product_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sections", :force => true do |t|
    t.string   "section"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sub_sections", :force => true do |t|
    t.string   "subsection"
    t.integer  "product_category_id"
    t.integer  "product_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "question"
    t.string   "answer"
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

  create_table "user_messages", :force => true do |t|
    t.text     "message",                                    :null => false
    t.string   "komu",                                       :null => false
    t.string   "result",     :default => "запущено"
    t.integer  "numsentmsg", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                   :null => false
    t.string   "groups",              :default => "blogger", :null => false
    t.string   "email",                                      :null => false
    t.integer  "active",              :default => 0,         :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                          :null => false
    t.string   "single_access_token",                        :null => false
    t.string   "perishable_token",                           :null => false
    t.integer  "login_count",         :default => 0,         :null => false
    t.integer  "failed_login_count",  :default => 0,         :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "fio"
  end

end
