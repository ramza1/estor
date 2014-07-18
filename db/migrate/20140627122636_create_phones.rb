class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer  "phone_type_id"
      t.string   "number",                         null: false
      t.string   "phoneable_type",                 null: false
      t.integer  "phoneable_id",                   null: false
      t.boolean  "primary",        default: false
      t.timestamps
    end

    add_index "phones", ["phone_type_id"], name: "index_phones_on_phone_type_id", using: :btree
    add_index "phones", ["phoneable_id"], name: "index_phones_on_phoneable_id", using: :btree
    add_index "phones", ["phoneable_type"], name: "index_phones_on_phoneable_type", using: :btree
  end
end
