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

ActiveRecord::Schema.define(:version => 20130627032409) do

  create_table "abcs", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "currents", :force => true do |t|
    t.string   "currency"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "price"
    t.integer  "price2"
    t.integer  "price3"
    t.integer  "price4"
    t.string   "sho1bun"
    t.string   "kban"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cost"
  end

  create_table "orders", :force => true do |t|
    t.integer  "sheet"
    t.string   "code"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "salesheads", :force => true do |t|
    t.string   "billno"
    t.integer  "price"
    t.string   "date"
    t.string   "custno"
    t.integer  "tokui_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "flg"
    t.integer  "tax"
    t.string   "currency1"
    t.integer  "price1"
    t.string   "currency2"
    t.integer  "price2"
    t.string   "currency3"
    t.integer  "price3"
    t.string   "currency4"
    t.integer  "price4"
    t.integer  "change"
    t.integer  "eda"
    t.string   "outlet"
    t.string   "sysday"
  end

  create_table "salesmeis", :force => true do |t|
    t.string   "billno"
    t.integer  "saleshead_id"
    t.string   "itemcode"
    t.integer  "item_id"
    t.integer  "value"
    t.integer  "itemprice"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.boolean  "flg"
    t.string   "itemname"
    t.string   "outlet"
    t.string   "sysday"
    t.string   "date"
  end

  add_index "salesmeis", ["item_id"], :name => "index_salesmeis_on_item_id"
  add_index "salesmeis", ["saleshead_id"], :name => "index_salesmeis_on_saleshead_id"

  create_table "sho1buns", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "tokuis", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "tokui1bun"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "tel"
    t.string   "kake"
    t.string   "tankakubun"
  end

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
    t.string   "username"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "zaiko_logs", :force => true do |t|
    t.string   "code"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "flg"
    t.integer  "kubun"
    t.integer  "user_id"
  end

  create_table "zaikos", :force => true do |t|
    t.string   "code"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

end
