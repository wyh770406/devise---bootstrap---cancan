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

ActiveRecord::Schema.define(:version => 20120705050315) do

  create_table "admins", :force => true do |t|
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
    t.integer  "failed_attempts",        :default => 5
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "admins", ["authentication_token"], :name => "index_admins_on_authentication_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "callno_pools", :force => true do |t|
    t.string   "name",         :limit => 40, :default => ""
    t.text     "desc"
    t.integer  "start_callno",               :default => 0
    t.integer  "end_callno",                 :default => 0
    t.boolean  "is_default",                 :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "sn_no",       :limit => 40, :default => "", :null => false
    t.string   "name",                      :default => "", :null => false
    t.text     "desc"
    t.string   "callno",      :limit => 10, :default => "", :null => false
    t.string   "callpass",    :limit => 10, :default => "", :null => false
    t.integer  "user_id",                   :default => 0,  :null => false
    t.string   "mac_address"
    t.string   "ip_address"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "devices", ["callno"], :name => "index_devices_on_callno", :unique => true
  add_index "devices", ["name"], :name => "index_devices_on_name", :unique => true
  add_index "devices", ["sn_no"], :name => "index_devices_on_sn_no", :unique => true

  create_table "devices_users", :id => false, :force => true do |t|
    t.integer "device_id"
    t.integer "user_id"
  end

  create_table "logs", :force => true do |t|
    t.string   "from",         :default => "", :null => false
    t.integer  "level",        :default => 0
    t.string   "cat",          :default => "", :null => false
    t.text     "msg"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "logable_id"
    t.string   "logable_type"
  end

  create_table "noregistration_devices", :force => true do |t|
    t.string   "sn_no",               :limit => 40, :default => "",    :null => false
    t.string   "name",                              :default => "",    :null => false
    t.string   "mac_address"
    t.string   "ip_address"
    t.boolean  "registration_status",               :default => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "noregistration_devices", ["name"], :name => "index_noregistration_devices_on_name", :unique => true
  add_index "noregistration_devices", ["sn_no"], :name => "index_noregistration_devices_on_sn_no", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "session_levels", :force => true do |t|
    t.string   "slevel_code", :limit => 10, :default => "", :null => false
    t.string   "slevel_name",               :default => "", :null => false
    t.text     "slevel_desc"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "session_levels", ["slevel_code"], :name => "index_session_levels_on_slevel_code", :unique => true

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "name"
    t.boolean  "enable",                 :default => true
    t.string   "mobile"
    t.date     "birth"
    t.integer  "session_level_id"
    t.string   "device_sn",              :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
