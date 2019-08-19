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

ActiveRecord::Schema.define(version: 2019_08_19_150633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "type"
    t.string "size"
    t.integer "bike_tag"
    t.string "bike_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_bikes_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "bike_id"
    t.bigint "garage_id"
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_bookings_on_bike_id"
    t.index ["garage_id"], name: "index_bookings_on_garage_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_chats_on_booking_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "feature_presences", force: :cascade do |t|
    t.bigint "garage_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_feature_presences_on_feature_id"
    t.index ["garage_id"], name: "index_feature_presences_on_garage_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "icon_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "garages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.integer "street_number"
    t.string "street_address"
    t.string "city"
    t.string "country"
    t.integer "capacity_reg_bikes"
    t.integer "capacity_large_bikes"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "image_galleries", force: :cascade do |t|
    t.bigint "garage_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_image_galleries_on_garage_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id"
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "payment_info"
    t.string "profile_image"
    t.string "street_number"
    t.string "street"
    t.string "city"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bikes", "users"
  add_foreign_key "bookings", "bikes"
  add_foreign_key "bookings", "garages"
  add_foreign_key "chats", "bookings"
  add_foreign_key "chats", "users"
  add_foreign_key "feature_presences", "features"
  add_foreign_key "feature_presences", "garages"
  add_foreign_key "garages", "users"
  add_foreign_key "image_galleries", "garages"
  add_foreign_key "reviews", "bookings"
end
