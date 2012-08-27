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

ActiveRecord::Schema.define(:version => 20120824114505) do

  create_table "addresses", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "region_id"
    t.string   "district_id"
    t.string   "city_id"
    t.string   "street_id"
    t.integer  "house"
    t.integer  "building"
    t.integer  "flat"
    t.integer  "type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["owner_id"], :name => "index_addresses_on_owner_id"
  add_index "addresses", ["owner_type"], :name => "index_addresses_on_owner_type"

  create_table "authorization_grants", :force => true do |t|
    t.string   "code",                           :null => false
    t.string   "granted_for",                    :null => false
    t.boolean  "used",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "authorization_grants", ["code"], :name => "index_authorization_grants_on_code", :unique => true

  create_table "declaration_issues", :force => true do |t|
    t.integer  "identity_card_id"
    t.integer  "source_identity_card_id"
    t.string   "number"
    t.datetime "date"
    t.datetime "document_receive_date"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "declaration_issues", ["identity_card_id"], :name => "index_declaration_issues_on_identity_card_id"

  create_table "identity_cards", :force => true do |t|
    t.integer  "extended_by_id"
    t.string   "extended_by_type"
    t.string   "serie"
    t.string   "number"
    t.date     "issue_date"
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

  add_index "identity_cards", ["extended_by_id"], :name => "index_identity_cards_on_extended_by_id"
  add_index "identity_cards", ["extended_by_type"], :name => "index_identity_cards_on_extended_by_type"
  add_index "identity_cards", ["number"], :name => "index_identity_cards_on_number"
  add_index "identity_cards", ["person_id"], :name => "index_identity_cards_on_person_id"
  add_index "identity_cards", ["serie"], :name => "index_identity_cards_on_serie"

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

  create_table "loss_issues", :force => true do |t|
    t.integer  "identity_card_id"
    t.datetime "loss_date"
    t.datetime "issue_date"
    t.string   "region_id"
    t.string   "loss_info"
    t.string   "issuer"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "loss_issues", ["identity_card_id"], :name => "index_loss_issues_on_identity_card_id"

  create_table "people", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "person_relations", :force => true do |t|
    t.integer  "type_id"
    t.integer  "person_id"
    t.integer  "children_id"
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
