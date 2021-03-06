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

ActiveRecord::Schema.define(:version => 20110717190710) do

  create_table "carts", :force => true do |t|
    t.integer  "wine_id"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "orders", :force => true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "address"
    t.string   "postalcode"
    t.string   "email"
    t.string   "accountnumber"
    t.string   "accountowner"
    t.integer  "ordernumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "url"
    t.boolean  "menu"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_categories", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "portrait_file_name"
    t.string   "portrait_content_type"
    t.integer  "portrait_file_size"
    t.datetime "portrait_updated_at"
    t.boolean  "menu"
  end

  create_table "wineries", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "winery_banner_file_name"
    t.string   "winery_banner_content_type"
    t.integer  "winery_banner_file_size"
    t.datetime "winery_banner_updated_at"
  end

  create_table "wines", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "wine_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "body"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.boolean  "sell"
    t.integer  "winery_id"
  end

end
