class CreateComment < ActiveRecord::Migration
  def change
    create_table "comments", force: true do |t|
      t.text     "note"
      t.string   "commentable_type"
      t.integer  "commentable_id"
      t.integer  "created_by"
      t.integer  "user_id"
      t.integer  "customer_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
    add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
    add_index "comments", ["created_by"], name: "index_comments_on_created_by", using: :btree
    add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
  end
end
