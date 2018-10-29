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

ActiveRecord::Schema.define(version: 20181029002641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_uploads", force: :cascade do |t|
    t.text     "attachment"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_uploads_on_article_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "body"
    t.string   "link"
    t.string   "jira_ticket"
    t.integer  "status",            default: 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "slug"
    t.datetime "deleted_at"
    t.integer  "impressions_count", default: 0
    t.boolean  "root",              default: false
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_articles_on_deleted_at", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_categories_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "group_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_groups_on_slug", unique: true, using: :btree
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "users_categories", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_users_categories_on_category_id", using: :btree
    t.index ["user_id"], name: "index_users_categories_on_user_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",   null: false
    t.integer  "item_id",     null: false
    t.string   "event",       null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "author_name"
    t.integer  "word_count"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "article_uploads", "articles"
  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "users_categories", "categories"
  add_foreign_key "users_categories", "users"
end
