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

ActiveRecord::Schema.define(version: 20160715191112) do

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

  create_table "notification_extras", force: :cascade do |t|
    t.hstore   "content"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.text     "big_text"
    t.string   "conversation_title"
    t.text     "info_text"
    t.string   "large_icon_file_name"
    t.string   "large_icon_content_type"
    t.integer  "large_icon_file_size"
    t.datetime "large_icon_updated_at"
    t.string   "large_icon_big_file_name"
    t.string   "large_icon_big_content_type"
    t.integer  "large_icon_big_file_size"
    t.datetime "large_icon_big_updated_at"
    t.string   "people",                        default: [],              array: true
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "progress"
    t.boolean  "progress_indeterminate"
    t.integer  "progress_max"
    t.text     "remote_input_history"
    t.string   "self_display_name"
    t.string   "small_icon_file_name"
    t.string   "small_icon_content_type"
    t.integer  "small_icon_file_size"
    t.datetime "small_icon_updated_at"
    t.text     "sub_text"
    t.text     "summary_text"
    t.text     "text"
    t.text     "text_lines",                    default: [],              array: true
    t.string   "title"
    t.string   "title_big"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["self_display_name"], name: "index_notification_extras_on_self_display_name", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "ticker_text"
    t.integer  "when_ms"
    t.datetime "when"
    t.integer  "visibility"
    t.integer  "priority"
    t.integer  "number"
    t.integer  "icon_level"
    t.integer  "flags"
    t.integer  "defaults"
    t.integer  "color"
    t.string   "category"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "large_icon_file_name"
    t.string   "large_icon_content_type"
    t.integer  "large_icon_file_size"
    t.datetime "large_icon_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status_bar_notification_id"
    t.integer  "notification_extra_id"
    t.index ["category"], name: "index_notifications_on_category", using: :btree
    t.index ["notification_extra_id"], name: "index_notifications_on_notification_extra_id", using: :btree
    t.index ["status_bar_notification_id"], name: "index_notifications_on_status_bar_notification_id", using: :btree
    t.index ["when"], name: "index_notifications_on_when", using: :btree
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
    t.integer  "notification_id"
    t.index ["group_key"], name: "index_status_bar_notifications_on_group_key", using: :btree
    t.index ["key"], name: "index_status_bar_notifications_on_key", using: :btree
    t.index ["location_id"], name: "index_status_bar_notifications_on_location_id", using: :btree
    t.index ["notification_id"], name: "index_status_bar_notifications_on_notification_id", using: :btree
    t.index ["package_name"], name: "index_status_bar_notifications_on_package_name", using: :btree
    t.index ["post_time"], name: "index_status_bar_notifications_on_post_time", using: :btree
  end

  add_foreign_key "notifications", "notification_extras"
  add_foreign_key "notifications", "status_bar_notifications"
  add_foreign_key "status_bar_notifications", "locations"
  add_foreign_key "status_bar_notifications", "notifications"
end
