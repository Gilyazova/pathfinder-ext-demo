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

ActiveRecord::Schema.define(:version => 20120820120449) do

  create_table "addresses", :force => true do |t|
    t.integer  "russian_passport_id"
    t.string   "region_id"
    t.string   "district_id"
    t.string   "city_id"
    t.string   "street_id"
    t.integer  "house"
    t.integer  "building"
    t.integer  "flat"
    t.integer  "type_id"
    t.string   "uri"
    t.datetime "create_date"
    t.datetime "update_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "authorization_grants", :force => true do |t|
    t.string   "code",                           :null => false
    t.string   "granted_for",                    :null => false
    t.boolean  "used",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "authorization_grants", ["code"], :name => "index_authorization_grants_on_code", :unique => true

  create_table "identity_cards", :force => true do |t|
    t.integer  "extended_by_id"
    t.string   "extended_by_type"
    t.string   "serie"
    t.string   "number"
    t.datetime "issue_date"
    t.string   "issuer_code"
    t.string   "issuer"
    t.string   "issue_place_code"
    t.integer  "type_id"
    t.integer  "reason_id"
    t.integer  "state_id"
    t.datetime "loss_date"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "person_id"
  end

  create_table "international_passports", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "first_name_latin"
    t.string   "last_name_latin"
    t.datetime "birth_date"
    t.string   "birth_place_code"
    t.integer  "citizenship_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "people", :force => true do |t|
    t.integer  "nationality"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "russian_passports", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.datetime "birth_date"
    t.string   "birth_place"
    t.integer  "sex_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
