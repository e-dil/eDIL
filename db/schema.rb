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

ActiveRecord::Schema.define(:version => 20120330071700) do

  create_table "bibls", :force => true do |t|
    t.string   "str"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "columns", :force => true do |t|
    t.integer  "letter_id"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "definitions", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.text     "body"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "orth"
  end

  create_table "entries_part_of_speeches", :force => true do |t|
    t.integer "entry_id"
    t.integer "part_of_speech_id"
  end

  create_table "lines", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.string   "str"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "column_id"
    t.string   "closed"
    t.string   "html"
  end

  create_table "part_of_speeches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "references", :force => true do |t|
    t.integer "entry_id"
    t.integer "bibl_id"
    t.string  "loc"
  end

end
