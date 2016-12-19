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

ActiveRecord::Schema.define(version: 20161217044314) do

  create_table "ans_seqs", force: :cascade do |t|
    t.integer  "ansnum"
    t.string   "status"
    t.datetime "ans_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "question_no"
    t.integer  "ans_num"
    t.string   "user"
    t.string   "ans_sec"
    t.datetime "ans_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
