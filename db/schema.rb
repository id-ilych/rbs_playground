# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_13_204019) do

  create_table "gadget_gadget_tags", force: :cascade do |t|
    t.integer "gadget_id", null: false
    t.integer "gadget_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gadget_id"], name: "index_gadget_gadget_tags_on_gadget_id"
    t.index ["gadget_tag_id"], name: "index_gadget_gadget_tags_on_gadget_tag_id"
  end

  create_table "gadget_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_gadget_tags_on_name", unique: true
  end

  create_table "gadget_traits", force: :cascade do |t|
    t.integer "gadget_id", null: false
    t.integer "trait_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gadget_id"], name: "index_gadget_traits_on_gadget_id"
    t.index ["trait_id"], name: "index_gadget_traits_on_trait_id"
  end

  create_table "gadgets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_gadgets_on_name", unique: true
  end

  create_table "role_gadgets", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "gadget_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gadget_id"], name: "index_role_gadgets_on_gadget_id"
    t.index ["role_id"], name: "index_role_gadgets_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_traits_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "credits", default: 0, null: false
    t.integer "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_wallets_on_role_id"
  end

  add_foreign_key "gadget_gadget_tags", "gadget_tags"
  add_foreign_key "gadget_gadget_tags", "gadgets"
  add_foreign_key "gadget_traits", "gadgets"
  add_foreign_key "gadget_traits", "traits"
  add_foreign_key "role_gadgets", "gadgets"
  add_foreign_key "role_gadgets", "roles"
  add_foreign_key "roles", "users"
  add_foreign_key "wallets", "roles"
end
