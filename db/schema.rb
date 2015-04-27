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

ActiveRecord::Schema.define(version: 20150427130413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: true do |t|
    t.string   "name",       null: false
    t.string   "image",      null: false
    t.integer  "points",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievements", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "badge_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["badge_id"], :name => "fk__achievements_badge_id", :order => {"badge_id" => :asc}
    t.index ["badge_id", "user_id"], :name => "index_achievements_on_badge_id_and_user_id", :unique => true, :order => {"badge_id" => :asc, "user_id" => :asc}
    t.foreign_key ["badge_id"], "badges", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_achievements_badge_id"
  end

  create_table "compartilhaco_campaigns", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.string   "hashtag"
    t.string   "title"
    t.text     "short_description"
    t.text     "description"
  end

  create_table "compartilhaco_facebook_profile_spreaders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.integer  "campaign_id"
  end

  create_table "compartilhaco_twitter_profile_spreaders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.integer  "campaign_id"
  end

  create_table "tasks", force: true do |t|
    t.integer  "task_type_id"
    t.integer  "points",          null: false
    t.string   "skills",                       array: true
    t.string   "title"
    t.string   "hashtag"
    t.integer  "max_deliveries"
    t.datetime "deadline"
    t.integer  "organization_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "skills",           default: [],    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profession"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "city"
    t.string   "state"
    t.text     "bio"
    t.boolean  "admin"
    t.boolean  "funder"
    t.string   "address_district"
    t.string   "website"
    t.boolean  "sponsor",          default: false
  end

  create_table "deliveries", force: true do |t|
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.integer  "user_id"
    t.integer  "task_id"
    t.index ["task_id"], :name => "fk__deliveries_task_id", :order => {"task_id" => :asc}
    t.index ["user_id"], :name => "fk__deliveries_user_id", :order => {"user_id" => :asc}
    t.foreign_key ["task_id"], "tasks", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_deliveries_task_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_deliveries_user_id"
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

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "avatar"
    t.string   "name"
    t.string   "slug"
    t.string   "facebook_page_uid"
  end

  create_table "panela_campaigns", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.string   "hashtag"
    t.text     "description"
    t.boolean  "succeed"
    t.string   "image"
    t.datetime "finished_at"
    t.text     "description_html"
    t.integer  "organization_id"
    t.index ["organization_id"], :name => "fk__panela_campaigns_organization_id", :order => {"organization_id" => :asc}
    t.foreign_key ["organization_id"], "organizations", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_panela_campaigns_organization_id"
  end

  create_table "panela_pokes", force: true do |t|
    t.datetime "created_at"
    t.integer  "campaign_id"
    t.integer  "user_id"
  end

  create_table "task_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_view "activities", " SELECT problems.name AS title,\n    problems.id AS activable_id,\n    problems.user_id,\n    problems.created_at,\n    problems.hashtag,\n    'Problem'::text AS activable_type\n   FROM problems\nUNION ALL\n SELECT ideas_problems.name AS title,\n    ideas.id AS activable_id,\n    ideas.user_id,\n    ideas.created_at,\n    ideas_problems.hashtag,\n    'Idea'::text AS activable_type\n   FROM (ideas\n     JOIN problems ideas_problems ON ((ideas_problems.id = ideas.problem_id)))\nUNION ALL\n SELECT tasks.title,\n    task_subscriptions.id AS activable_id,\n    task_subscriptions.user_id,\n    task_subscriptions.created_at,\n    tasks.hashtag,\n    'TaskSubscription'::text AS activable_type\n   FROM (task_subscriptions\n     JOIN tasks ON ((tasks.id = task_subscriptions.task_id)))\nUNION ALL\n SELECT tasks.title,\n    deliveries.id AS activable_id,\n    deliveries.user_id,\n    deliveries.accepted_at AS created_at,\n    tasks.hashtag,\n    'Delivery'::text AS activable_type\n   FROM (deliveries\n     JOIN tasks ON ((tasks.id = deliveries.task_id)))\n  WHERE (deliveries.accepted_at IS NOT NULL)\nUNION ALL\n SELECT compartilhaco_campaigns.title,\n    compartilhaco_campaigns.id AS activable_id,\n    compartilhaco_campaigns.user_id,\n    compartilhaco_campaigns.created_at,\n    compartilhaco_campaigns.hashtag,\n    'CompartilhacoCampaign'::text AS activable_type\n   FROM compartilhaco_campaigns\nUNION ALL\n SELECT cc.title,\n    cfps.id AS activable_id,\n    cfps.user_id,\n    cfps.created_at,\n    cc.hashtag,\n    'CompartilhacoFacebookProfileSpreader'::text AS activable_type\n   FROM (compartilhaco_facebook_profile_spreaders cfps\n     JOIN compartilhaco_campaigns cc ON ((cc.id = cfps.campaign_id)))\nUNION ALL\n SELECT cc.title,\n    ctps.id AS activable_id,\n    ctps.user_id,\n    ctps.created_at,\n    cc.hashtag,\n    'CompartilhacoTwitterProfileSpreader'::text AS activable_type\n   FROM (compartilhaco_twitter_profile_spreaders ctps\n     JOIN compartilhaco_campaigns cc ON ((cc.id = ctps.campaign_id)))\nUNION ALL\n SELECT panela_campaigns.name AS title,\n    panela_campaigns.id AS activable_id,\n    panela_campaigns.user_id,\n    panela_campaigns.created_at,\n    panela_campaigns.hashtag,\n    'PanelaCampaign'::text AS activable_type\n   FROM panela_campaigns\nUNION ALL\n SELECT panela_poke_campaigns.name AS title,\n    panela_pokes.id AS activable_id,\n    panela_pokes.user_id,\n    panela_pokes.created_at,\n    panela_poke_campaigns.hashtag,\n    'PanelaPoke'::text AS activable_type\n   FROM (panela_pokes\n     JOIN panela_campaigns panela_poke_campaigns ON ((panela_poke_campaigns.id = panela_pokes.campaign_id)))\n  ORDER BY 4 DESC", :force => true
  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "task_types", force: true do |t|
    t.string   "name",        null: false
    t.integer  "points",      null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mode"
    t.index ["category_id"], :name => "fk__task_types_category_id", :order => {"category_id" => :asc}
    t.foreign_key ["category_id"], "categories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_task_types_category_id"
  end

  create_table "badges_task_types", id: false, force: true do |t|
    t.integer "badge_id"
    t.integer "task_type_id"
    t.index ["badge_id"], :name => "fk__badges_task_types_badge_id", :order => {"badge_id" => :asc}
    t.index ["task_type_id"], :name => "fk__badges_task_types_task_type_id", :order => {"task_type_id" => :asc}
    t.index ["badge_id", "task_type_id"], :name => "index_badges_task_types_on_badge_id_and_task_type_id", :unique => true, :order => {"badge_id" => :asc, "task_type_id" => :asc}
    t.foreign_key ["badge_id"], "badges", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_badges_task_types_badge_id"
    t.foreign_key ["task_type_id"], "task_types", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_badges_task_types_task_type_id"
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
    t.integer  "organization_id"
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
    t.integer  "organization_id"
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

  create_view "comments", " SELECT t.id,\n    t.created_at,\n    t.text,\n    t.hashtag,\n    t.username,\n    t.published_at,\n    t.text_html,\n    t.user_uid,\n    t.retweet_count AS share_count,\n    t.favorite_count AS like_count,\n    t.comment_count,\n    'tweets'::text AS relname\n   FROM tweets t\nUNION ALL\n SELECT fp.id,\n    fp.created_at,\n    fp.text,\n    fp.hashtag,\n    fp.username,\n    fp.published_at,\n    fp.text_html,\n    fp.user_uid,\n    fp.share_count,\n    fp.like_count,\n    fp.comment_count,\n    'facebook_posts'::text AS relname\n   FROM facebook_posts fp", :force => true
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

  create_table "events", force: true do |t|
    t.string   "hashtag"
    t.integer  "attending_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "organization_id"
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

  create_view "facts", " SELECT e.id,\n    e.created_at,\n    e.name,\n    e.description_html,\n    e.link,\n    e.hashtag,\n    'petitions'::text AS relname\n   FROM petitions e\nUNION ALL\n SELECT p.id,\n    p.created_at,\n    p.name,\n    p.description AS description_html,\n    p.link,\n    p.hashtag,\n    'problems'::text AS relname\n   FROM problems p\nUNION ALL\n SELECT e.id,\n    e.created_at,\n    e.name,\n    e.description AS description_html,\n    e.link,\n    e.hashtag,\n    'events'::text AS relname\n   FROM events e\nUNION ALL\n SELECT cc.id,\n    cc.created_at,\n    cc.title AS name,\n    cc.description AS description_html,\n    ''::character varying AS link,\n    cc.hashtag,\n    'compartilhaco_campaigns'::text AS relname\n   FROM compartilhaco_campaigns cc\nUNION ALL\n SELECT panela_campaigns.id,\n    panela_campaigns.created_at,\n    panela_campaigns.name,\n    panela_campaigns.description_html,\n    ''::character varying AS link,\n    panela_campaigns.hashtag,\n    'panela_campaigns'::text AS relname\n   FROM panela_campaigns", :force => true
  create_table "images", force: true do |t|
    t.string   "file"
    t.string   "hashtag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.integer  "share_count"
    t.integer  "like_count"
    t.integer  "organization_id"
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
    t.boolean  "territorial", default: false
  end

  create_table "multitude_rewards", force: true do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.index ["task_id"], :name => "fk__multitude_rewards_task_id", :order => {"task_id" => :asc}
    t.index ["user_id"], :name => "fk__multitude_rewards_user_id", :order => {"user_id" => :asc}
    t.foreign_key ["task_id"], "tasks", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_multitude_rewards_task_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_multitude_rewards_user_id"
  end

  create_table "rewards", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "task_type_id", null: false
    t.integer  "points",       null: false
    t.string   "source_app",   null: false
    t.string   "source_model", null: false
    t.integer  "source_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["task_type_id"], :name => "fk__rewards_task_type_id", :order => {"task_type_id" => :asc}
    t.foreign_key ["task_type_id"], "task_types", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_rewards_task_type_id"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.string   "cas_ticket"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cas_ticket"], :name => "index_sessions_on_cas_ticket", :order => {"cas_ticket" => :asc}
    t.index ["session_id"], :name => "index_sessions_on_session_id", :order => {"session_id" => :asc}
    t.index ["updated_at"], :name => "index_sessions_on_updated_at", :order => {"updated_at" => :asc}
  end

  create_table "squeezes", force: true do |t|
    t.string "email"
  end

  create_table "successful_transactions", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], :name => "fk__successful_transactions_user_id", :order => {"user_id" => :asc}
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_successful_transactions_user_id"
  end

end
