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

ActiveRecord::Schema.define(version: 20160715151029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "hstore"

  create_table "locations", force: :cascade do |t|
    t.float     "accuracy"
    t.float     "altitude"
    t.float     "bearing"
    t.float     "elapsed_real_time_nanos"
    t.hstore    "extras"
    t.float     "latitude"
    t.float     "longitude"
    t.string    "provider"
    t.float     "speed"
    t.float     "time"
    t.geography "lonlat",                  limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.geography "lonlatheight",            limit: {:srid=>4326, :type=>"point", :has_z=>true, :geographic=>true}
    t.datetime  "created_at",                                                                                     null: false
    t.datetime  "updated_at",                                                                                     null: false
    t.index ["provider"], name: "index_locations_on_provider", using: :btree
  end

  create_table "status_bar_notifications", force: :cascade do |t|
    t.string   "group_key"
    t.string   "key"
    t.string   "override_group_key"
    t.integer  "post_time_ms"
    t.datetime "post_time"
    t.string   "tag"
    t.integer  "android_user_id"
    t.boolean  "is_clearable"
    t.boolean  "is_group"
    t.boolean  "is_ongoing"
    t.integer  "android_notification_id"
    t.string   "package_name"
    t.integer  "location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["group_key"], name: "index_status_bar_notifications_on_group_key", using: :btree
    t.index ["key"], name: "index_status_bar_notifications_on_key", using: :btree
    t.index ["location_id"], name: "index_status_bar_notifications_on_location_id", using: :btree
    t.index ["package_name"], name: "index_status_bar_notifications_on_package_name", using: :btree
    t.index ["post_time"], name: "index_status_bar_notifications_on_post_time", using: :btree
  end

  add_foreign_key "status_bar_notifications", "locations"
end
