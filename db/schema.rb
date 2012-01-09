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

ActiveRecord::Schema.define(:version => 20120109110912) do

  create_table "basecamp_projects", :force => true do |t|
    t.integer  "basecampid"
    t.string   "name"
    t.string   "status"
    t.date     "created_on"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "basecampid"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "uuid"
    t.string   "title"
    t.string   "phone_number_mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clientid"
  end

  create_table "todolists", :force => true do |t|
    t.string   "name"
    t.integer  "completed_count"
    t.integer  "uncompleted_count"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "complete"
  end

end
