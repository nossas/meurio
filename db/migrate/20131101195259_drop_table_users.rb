class DropTableUsers < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table "users" do |t|
      t.string   "email",                  default: "",   null: false
      t.string   "encrypted_password",     default: "",   null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,    null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "unconfirmed_email"
      t.string   "image"
      t.text     "bio"
      t.date     "birthdate"
      t.string   "profession"
      t.string   "gender"
      t.string   "phone"
      t.string   "secondary_email"
      t.boolean  "public",                 default: true
      t.string   "home_postcode"
      t.string   "home_address_street"
      t.string   "home_address_district"
      t.string   "home_city"
      t.string   "home_state"
      t.string   "facebook_url"
      t.string   "twitter_url"
      t.string   "website"
      t.boolean  "admin"
    end
  end
end
