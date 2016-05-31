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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160531151034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.boolean  "remote"
    t.string   "location_city"
    t.string   "location_country"
    t.integer  "contract_zip_code"
    t.string   "contract_street"
    t.string   "contract_city"
    t.string   "contract_country"
    t.integer  "taxpayer_id"
    t.integer  "register_number"
    t.date     "register_number_start_date"
    t.integer  "c_a_number"
    t.string   "bank_name"
    t.integer  "bank_zip_code"
    t.string   "bank_street"
    t.string   "bank_city"
    t.string   "bank_country"
    t.string   "swift_code"
    t.integer  "iban_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end