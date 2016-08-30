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

ActiveRecord::Schema.define(version: 20160830091417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "num_ranges", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "minimum",    null: false
    t.integer  "maximum",    null: false
    t.boolean  "required",   null: false
    t.integer  "survey_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_num_ranges_on_survey_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.integer  "survey_id"
    t.integer  "options"
    t.boolean  "multi_select"
    t.boolean  "required"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "response_options", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.text     "text",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_response_options_on_question_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
