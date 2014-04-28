class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string   "batchable_type"
      t.integer  "batchable_id"
      t.timestamps
    end
    add_index "batches", ["batchable_id"], name: "index_batches_on_batchable_id", using: :btree
    add_index "batches", ["batchable_type"], name: "index_batches_on_batchable_type", using: :btree
  end
end
