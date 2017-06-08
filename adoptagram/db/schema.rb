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

ActiveRecord::Schema.define(version: 20170608191209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoption_applications", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "agency_id"
    t.integer  "user_id"
    t.text     "comments"
    t.boolean  "contacted",   default: false
    t.boolean  "interviewed", default: false
    t.boolean  "approved",    default: false
    t.boolean  "accepted",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "adoption_applications", ["agency_id"], name: "index_adoption_applications_on_agency_id", using: :btree
  add_index "adoption_applications", ["animal_id"], name: "index_adoption_applications_on_animal_id", using: :btree
  add_index "adoption_applications", ["user_id"], name: "index_adoption_applications_on_user_id", using: :btree

  create_table "agencies", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

  create_table "agency_contacts", force: :cascade do |t|
    t.integer  "agency_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "agency_contacts", ["agency_id"], name: "index_agency_contacts_on_agency_id", using: :btree

  create_table "animals", force: :cascade do |t|
    t.integer  "agency_id"
    t.string   "name"
    t.string   "breed"
    t.date     "birthday"
    t.string   "gender"
    t.string   "species"
    t.boolean  "adopted",    default: false
    t.boolean  "fostered",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "weight"
  end

  add_index "animals", ["agency_id"], name: "index_animals_on_agency_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "commenter_type"
    t.integer  "commenter_id"
    t.text     "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "family_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "adults"
    t.integer  "children"
    t.string   "home_type"
    t.string   "description"
    t.string   "landlord"
    t.string   "phone"
    t.text     "allergies"
    t.boolean  "agreement"
    t.boolean  "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "family_infos", ["user_id"], name: "index_family_infos_on_user_id", using: :btree

  create_table "foster_applications", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "agency_id"
    t.integer  "user_id"
    t.text     "comments"
    t.boolean  "contacted",   default: false
    t.boolean  "interviewed", default: false
    t.boolean  "approved",    default: false
    t.boolean  "accepted",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "foster_applications", ["agency_id"], name: "index_foster_applications_on_agency_id", using: :btree
  add_index "foster_applications", ["animal_id"], name: "index_foster_applications_on_animal_id", using: :btree
  add_index "foster_applications", ["user_id"], name: "index_foster_applications_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "agency_id"
    t.integer  "user_id"
    t.integer  "animal_id"
    t.boolean  "agencyread", default: false
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "userread",   default: false
  end

  add_index "messages", ["agency_id"], name: "index_messages_on_agency_id", using: :btree
  add_index "messages", ["animal_id"], name: "index_messages_on_animal_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "other_pets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "number"
    t.text     "animal_type"
    t.boolean  "vacinated"
    t.boolean  "fixed"
    t.boolean  "lost"
    t.text     "discipline"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "other_pets", ["user_id"], name: "index_other_pets_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "agency_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "posts", ["agency_id"], name: "index_posts_on_agency_id", using: :btree
  add_index "posts", ["animal_id"], name: "index_posts_on_animal_id", using: :btree

  create_table "user_contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first"
    t.string   "last"
    t.string   "occupation"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "best_contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_contacts", ["user_id"], name: "index_user_contacts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vets", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "have"
    t.string   "name"
    t.string   "clinic"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vets", ["user_id"], name: "index_vets_on_user_id", using: :btree

  add_foreign_key "adoption_applications", "agencies"
  add_foreign_key "adoption_applications", "animals"
  add_foreign_key "adoption_applications", "users"
  add_foreign_key "agency_contacts", "agencies"
  add_foreign_key "animals", "agencies"
  add_foreign_key "comments", "posts"
  add_foreign_key "family_infos", "users"
  add_foreign_key "foster_applications", "agencies"
  add_foreign_key "foster_applications", "animals"
  add_foreign_key "foster_applications", "users"
  add_foreign_key "messages", "agencies"
  add_foreign_key "messages", "animals"
  add_foreign_key "messages", "users"
  add_foreign_key "other_pets", "users"
  add_foreign_key "posts", "agencies"
  add_foreign_key "posts", "animals", on_delete: :cascade
  add_foreign_key "user_contacts", "users"
  add_foreign_key "vets", "users"
end
