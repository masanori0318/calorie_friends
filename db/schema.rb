# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_08_122535) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "calories", charset: "utf8", force: :cascade do |t|
    t.integer "breakfast_cal", null: false
    t.integer "lunch_cal", null: false
    t.integer "dinner_cal", null: false
    t.integer "snack_cal", null: false
    t.integer "total_calorie", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_calories_on_user_id"
  end

  create_table "images", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breakfast_img"
    t.string "lunch_img"
    t.string "dinner_img"
    t.string "snack_img"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "meal_calorie_images", charset: "utf8", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "calorie_id", null: false
    t.bigint "image_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calorie_id"], name: "index_meal_calorie_images_on_calorie_id"
    t.index ["image_id"], name: "index_meal_calorie_images_on_image_id"
    t.index ["meal_id"], name: "index_meal_calorie_images_on_meal_id"
    t.index ["user_id"], name: "index_meal_calorie_images_on_user_id"
  end

  create_table "meals", charset: "utf8", force: :cascade do |t|
    t.string "breakfast", null: false
    t.string "lunch", null: false
    t.string "dinner", null: false
    t.string "snack", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "calories", "users"
  add_foreign_key "images", "users"
  add_foreign_key "meal_calorie_images", "calories", column: "calorie_id"
  add_foreign_key "meal_calorie_images", "images"
  add_foreign_key "meal_calorie_images", "meals"
  add_foreign_key "meal_calorie_images", "users"
  add_foreign_key "meals", "users"
end
