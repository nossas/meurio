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

ActiveRecord::Schema.define(version: 20130919135930) do

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description_html"
    t.integer  "mobilization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "mobilizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "background_image"
    t.string   "hashtag"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.integer  "mobilization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.index ["mobilization_id"], :name => "fk__problems_mobilization_id", :order => {"mobilization_id" => :asc}
    t.index ["mobilization_id"], :name => "index_problems_on_mobilization_id", :order => {"mobilization_id" => :asc}
    t.foreign_key ["mobilization_id"], "mobilizations", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_problems_mobilization_id"
  end

  create_view "facts", "SELECT c.id, c.created_at, c.name, c.description_html, c.link, c.mobilization_id, 'campaigns'::text AS relname FROM campaigns c UNION ALL SELECT p.id, p.created_at, p.name, p.description AS description_html, p.link, p.mobilization_id, 'problems'::text AS relname FROM problems p", :force => true
  create_table "ideas", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id"
    t.string   "uid"
    t.index ["problem_id"], :name => "index_ideas_on_problem_id", :order => {"problem_id" => :asc}
    t.foreign_key ["problem_id"], "problems", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_ideas_problem_id"
  end

  create_table "pokes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.string   "uid"
    t.index ["campaign_id"], :name => "fk__pokes_campaign_id", :order => {"campaign_id" => :asc}
    t.foreign_key ["campaign_id"], "campaigns", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_pokes_campaign_id"
  end

end
