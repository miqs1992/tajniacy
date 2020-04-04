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

ActiveRecord::Schema.define(version: 2020_03_30_183307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "starting_team", default: "red", null: false
    t.index ["creator_id"], name: "index_games_on_creator_id"
    t.index ["status"], name: "index_games_on_status"
  end

  create_table "games_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.string "team", default: "red", null: false
    t.boolean "captain", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["captain"], name: "index_games_users_on_captain"
    t.index ["game_id"], name: "index_games_users_on_game_id"
    t.index ["team"], name: "index_games_users_on_team"
    t.index ["user_id"], name: "index_games_users_on_user_id"
  end

  create_table "tiles", force: :cascade do |t|
    t.string "word", null: false
    t.integer "tile_type", default: 0, null: false
    t.boolean "hit", default: false, null: false
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_tiles_on_game_id"
    t.index ["tile_type"], name: "index_tiles_on_tile_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "games", "users", column: "creator_id"
  add_foreign_key "games_users", "games"
  add_foreign_key "games_users", "users"
end
