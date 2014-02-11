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

ActiveRecord::Schema.define(version: 20140211125531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description_html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "hashtag"
    t.integer  "user_id"
    t.string   "user_email"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "hashtag"
    t.integer  "user_id"
    t.string   "user_email"
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "user_email"
    t.index ["problem_id"], :name => "index_ideas_on_problem_id", :order => {"problem_id" => :asc}
    t.foreign_key ["problem_id"], "problems", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_ideas_problem_id"
  end

  create_table "pokes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "user_email"
    t.index ["campaign_id"], :name => "fk__pokes_campaign_id", :order => {"campaign_id" => :asc}
    t.foreign_key ["campaign_id"], "campaigns", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_pokes_campaign_id"
  end

  create_view "activities", "        (        (         SELECT campaigns.id, \n                            campaigns.user_id, \n                            campaigns.created_at, \n                            campaigns.hashtag, \n                            'campaigns'::text AS relname\n                           FROM campaigns\n                UNION ALL \n                         SELECT pokes.id, \n                            pokes.user_id, \n                            pokes.created_at, \n                            pokes_campaigns.hashtag, \n                            'pokes'::text AS relname\n                           FROM (pokes\n                      JOIN campaigns pokes_campaigns ON ((pokes_campaigns.id = pokes.campaign_id))))\n        UNION ALL \n                 SELECT problems.id, \n                    problems.user_id, \n                    problems.created_at, \n                    problems.hashtag, \n                    'problems'::text AS relname\n                   FROM problems)\nUNION ALL \n         SELECT ideas.id, \n            ideas.user_id, \n            ideas.created_at, \n            ideas_problems.hashtag, \n            'ideas'::text AS relname\n           FROM (ideas\n      JOIN problems ideas_problems ON ((ideas_problems.id = ideas.problem_id)))", :force => true
  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "clippings", force: true do |t|
    t.datetime "published_at"
    t.text     "body"
    t.string   "link"
    t.string   "image"
    t.string   "hashtag"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_posts", force: true do |t|
    t.text     "text"
    t.string   "hashtag"
    t.string   "username"
    t.datetime "published_at"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text_html"
    t.string   "user_uid"
    t.integer  "share_count"
    t.integer  "like_count"
    t.integer  "comment_count"
  end

  create_table "tweets", force: true do |t|
    t.text     "text"
    t.string   "hashtag"
    t.string   "username"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.text     "text_html"
    t.string   "user_uid"
    t.integer  "retweet_count"
    t.integer  "favorite_count"
    t.integer  "comment_count"
  end

  create_view "comments", "         SELECT t.id, \n            t.created_at, \n            t.text, \n            t.hashtag, \n            t.username, \n            t.published_at, \n            t.text_html, \n            t.user_uid, \n            t.retweet_count AS share_count, \n            t.favorite_count AS like_count, \n            t.comment_count, \n            'tweets'::text AS relname\n           FROM tweets t\nUNION ALL \n         SELECT fp.id, \n            fp.created_at, \n            fp.text, \n            fp.hashtag, \n            fp.username, \n            fp.published_at, \n            fp.text_html, \n            fp.user_uid, \n            fp.share_count, \n            fp.like_count, \n            fp.comment_count, \n            'facebook_posts'::text AS relname\n           FROM facebook_posts fp", :force => true
  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], :name => "delayed_jobs_priority", :order => {"priority" => :asc, "run_at" => :asc}
  end

  create_table "deliveries", force: true do |t|
    t.integer  "task_subscription_id"
    t.datetime "accepted_at"
  end

  create_table "events", force: true do |t|
    t.string   "hashtag"
    t.integer  "attending_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "name"
    t.text     "description"
    t.string   "link"
  end

  create_table "petitions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashtag"
    t.string   "name"
    t.text     "description_html"
    t.string   "link"
    t.string   "uid"
    t.integer  "signatures_count"
  end

  create_view "facts", "        (        (         SELECT e.id, \n                            e.created_at, \n                            e.name, \n                            e.description_html, \n                            e.link, \n                            e.hashtag, \n                            'petitions'::text AS relname\n                           FROM petitions e\n                UNION ALL \n                         SELECT c.id, \n                            c.created_at, \n                            c.name, \n                            c.description_html, \n                            c.link, \n                            c.hashtag, \n                            'campaigns'::text AS relname\n                           FROM campaigns c)\n        UNION ALL \n                 SELECT p.id, \n                    p.created_at, \n                    p.name, \n                    p.description AS description_html, \n                    p.link, \n                    p.hashtag, \n                    'problems'::text AS relname\n                   FROM problems p)\nUNION ALL \n         SELECT e.id, \n            e.created_at, \n            e.name, \n            e.description AS description_html, \n            e.link, \n            e.hashtag, \n            'events'::text AS relname\n           FROM events e", :force => true
  create_table "images", force: true do |t|
    t.string   "file"
    t.string   "hashtag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.integer  "share_count"
    t.integer  "like_count"
  end

  create_table "mobilizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "hashtag"
    t.string   "short_title"
    t.integer  "user_id"
    t.string   "thumbnail"
  end

  create_table "task_subscriptions", force: true do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  create_table "task_types", force: true do |t|
    t.string   "name",        null: false
    t.integer  "points",      null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], :name => "fk__task_types_category_id", :order => {"category_id" => :asc}
    t.foreign_key ["category_id"], "categories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_task_types_category_id"
  end

  create_table "tasks", force: true do |t|
    t.integer "task_type_id"
    t.integer "points",       null: false
  end

end
