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

ActiveRecord::Schema.define(version: 20140428135031) do

  create_table "accounting_adjustments", force: true do |t|
    t.integer  "adjustable_id",                           null: false
    t.string   "adjustable_type",                         null: false
    t.string   "notes"
    t.decimal  "amount",          precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "accounting_adjustments", ["adjustable_id"], name: "index_accounting_adjustments_on_adjustable_id", using: :btree
  add_index "accounting_adjustments", ["shop_id"], name: "index_accounting_adjustments_on_shop_id", using: :btree

  create_table "addresses", force: true do |t|
    t.integer  "address_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "addressable_type",                  null: false
    t.integer  "addressable_id",                    null: false
    t.string   "address1",                          null: false
    t.string   "address2"
    t.string   "city",                              null: false
    t.integer  "state_id"
    t.string   "state_name"
    t.string   "zip_code",                          null: false
    t.integer  "phone_id"
    t.string   "alternative_phone"
    t.boolean  "default",           default: false
    t.boolean  "billing_default",   default: false
    t.boolean  "active",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "shop_id"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  add_index "addresses", ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree
  add_index "addresses", ["shop_id"], name: "index_addresses_on_shop_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "adverts", force: true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "advert_image_file_name"
    t.string   "advert_image_content_type"
    t.integer  "advert_image_file_size"
    t.datetime "advert_image_updated_at"
    t.integer  "shop_id"
  end

  add_index "adverts", ["shop_id"], name: "index_adverts_on_shop_id", using: :btree

  create_table "batches", force: true do |t|
    t.string   "batchable_type"
    t.integer  "batchable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "batches", ["batchable_id"], name: "index_batches_on_batchable_id", using: :btree
  add_index "batches", ["batchable_type"], name: "index_batches_on_batchable_type", using: :btree
  add_index "batches", ["shop_id"], name: "index_batches_on_shop_id", using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "shop_id"
  end

  add_index "brands", ["shop_id"], name: "index_brands_on_shop_id", using: :btree

  create_table "cart_items", force: true do |t|
    t.integer  "customer_id"
    t.integer  "item_type_id"
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",     default: 1
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "shop_id"
    t.integer  "variant_id"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["customer_id"], name: "index_cart_items_on_customer_id", using: :btree
  add_index "cart_items", ["item_type_id"], name: "index_cart_items_on_item_type_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  add_index "cart_items", ["shop_id"], name: "index_cart_items_on_shop_id", using: :btree
  add_index "cart_items", ["variant_id"], name: "index_cart_items_on_variant_id", using: :btree

  create_table "carts", force: true do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "shop_id"
    t.integer  "user_id"
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id", using: :btree
  add_index "carts", ["shop_id"], name: "index_carts_on_shop_id", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
  end

  add_index "categories", ["shop_id"], name: "index_categories_on_shop_id", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "order_id"
    t.integer  "customer_id"
    t.string   "shop_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "shop_id"
  end

  add_index "comments", ["customer_id"], name: "index_comments_on_customer_id", using: :btree
  add_index "comments", ["order_id"], name: "index_comments_on_order_id", using: :btree
  add_index "comments", ["shop_id"], name: "index_comments_on_shop_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "abbreviation",     limit: 5
    t.integer  "shipping_zone_id"
    t.boolean  "active",                     default: false
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["active"], name: "index_countries_on_active", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["shipping_zone_id", "active"], name: "index_countries_on_shipping_zone_id_and_active", using: :btree
  add_index "countries", ["shop_id"], name: "index_countries_on_shop_id", using: :btree

  create_table "coupons", force: true do |t|
    t.integer  "shop_id"
    t.string   "type",                                                  null: false
    t.string   "code",                                                  null: false
    t.decimal  "amount",        precision: 8, scale: 2, default: 0.0
    t.decimal  "minimum_value", precision: 8, scale: 2
    t.integer  "percent",                               default: 0
    t.text     "description",                                           null: false
    t.boolean  "combine",                               default: false
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupons", ["code"], name: "index_coupons_on_code", using: :btree
  add_index "coupons", ["expires_at"], name: "index_coupons_on_expires_at", using: :btree
  add_index "coupons", ["shop_id"], name: "index_coupons_on_shop_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "address"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "shop_id"
    t.string   "customer_cim_id"
    t.string   "comments_count",         default: "0"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  add_index "customers", ["shop_id"], name: "index_customers_on_shop_id", using: :btree

  create_table "deal_types", force: true do |t|
    t.string   "name",       null: false
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deal_types", ["shop_id"], name: "index_deal_types_on_shop_id", using: :btree

  create_table "deals", force: true do |t|
    t.integer  "buy_quantity",    null: false
    t.integer  "get_percentage"
    t.integer  "deal_type_id",    null: false
    t.integer  "product_type_id", null: false
    t.integer  "get_amount"
    t.integer  "shop_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["buy_quantity"], name: "index_deals_on_buy_quantity", using: :btree
  add_index "deals", ["deal_type_id"], name: "index_deals_on_deal_type_id", using: :btree
  add_index "deals", ["product_type_id"], name: "index_deals_on_product_type_id", using: :btree
  add_index "deals", ["shop_id"], name: "index_deals_on_shop_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "image_groups", force: true do |t|
    t.integer  "shop_id"
    t.integer  "product_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_groups", ["product_id"], name: "index_image_groups_on_product_id", using: :btree
  add_index "image_groups", ["shop_id"], name: "index_image_groups_on_shop_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "image_height"
    t.integer  "image_width"
    t.integer  "position"
    t.string   "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "shop_id"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree
  add_index "images", ["shop_id"], name: "index_images_on_shop_id", using: :btree

  create_table "inventories", force: true do |t|
    t.integer  "count_on_hand",               default: 0
    t.integer  "count_pending_to_customer",   default: 0
    t.integer  "count_pending_from_supplier", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "inventories", ["shop_id"], name: "index_inventories_on_shop_id", using: :btree

  create_table "item_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
  end

  add_index "item_types", ["shop_id"], name: "index_item_types_on_shop_id", using: :btree

  create_table "mailing_lists", force: true do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
  end

  add_index "mailing_lists", ["shop_id"], name: "index_mailing_lists_on_shop_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_letters", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
  end

  add_index "news_letters", ["shop_id"], name: "index_news_letters_on_shop_id", using: :btree

  create_table "order_items", force: true do |t|
    t.decimal  "price",            precision: 8, scale: 2
    t.decimal  "total",            precision: 8, scale: 2
    t.integer  "order_id",                                 null: false
    t.string   "state"
    t.integer  "shipping_rate_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "shop_id"
    t.integer  "variant_id"
    t.integer  "tax_rate_id"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["shipping_rate_id"], name: "index_order_items_on_shipping_rate_id", using: :btree
  add_index "order_items", ["shop_id"], name: "index_order_items_on_shop_id", using: :btree
  add_index "order_items", ["tax_rate_id"], name: "index_order_items_on_tax_rate_id", using: :btree
  add_index "order_items", ["variant_id"], name: "index_order_items_on_variant_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "number"
    t.string   "ip_address"
    t.string   "email"
    t.string   "state"
    t.integer  "customer_id"
    t.boolean  "active",                                   default: false
    t.boolean  "shipped",                                  default: false
    t.integer  "shipments_count"
    t.datetime "calculated_at"
    t.datetime "completed_at"
    t.decimal  "credited_amount", precision: 10, scale: 0
    t.integer  "ship_address_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "shipping_fee",                             default: 0
    t.decimal  "price",           precision: 10, scale: 0, default: 0
    t.integer  "shop_id"
    t.string   "slug"
    t.integer  "bill_address_id"
    t.integer  "coupon_id"
  end

  add_index "orders", ["bill_address_id"], name: "index_orders_on_bill_address_id", using: :btree
  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["ship_address_id"], name: "index_orders_on_ship_address_id", using: :btree
  add_index "orders", ["shop_id"], name: "index_orders_on_shop_id", using: :btree
  add_index "orders", ["slug"], name: "index_orders_on_slug", using: :btree

  create_table "posts", force: true do |t|
    t.datetime "published_at"
    t.text     "body"
    t.string   "description"
    t.string   "title"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.integer  "shop_id"
  end

  add_index "posts", ["shop_id"], name: "index_posts_on_shop_id", using: :btree

  create_table "product_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_fields", ["product_type_id"], name: "index_product_fields_on_product_type_id", using: :btree

  create_table "product_properties", force: true do |t|
    t.integer "product_id",  null: false
    t.integer "property_id", null: false
    t.integer "position"
    t.string  "description", null: false
    t.integer "shop_id"
  end

  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree
  add_index "product_properties", ["property_id"], name: "index_product_properties_on_property_id", using: :btree
  add_index "product_properties", ["shop_id"], name: "index_product_properties_on_shop_id", using: :btree

  create_table "product_types", force: true do |t|
    t.string  "name",                     null: false
    t.integer "parent_id"
    t.boolean "active",    default: true
    t.integer "shop_id"
    t.integer "rgt"
    t.integer "lft"
  end

  add_index "product_types", ["parent_id"], name: "index_product_types_on_parent_id", using: :btree
  add_index "product_types", ["shop_id"], name: "index_product_types_on_shop_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "shop_id"
    t.boolean  "featured",                                      default: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "product_type_id"
    t.text     "properties"
    t.decimal  "price",                precision: 8,  scale: 2, default: 0.0,   null: false
    t.integer  "quantity_available",                            default: 0
    t.integer  "quantity_pending",                              default: 0
    t.integer  "category_id"
    t.string   "sku"
    t.integer  "brand_id"
    t.decimal  "discount",             precision: 10, scale: 0, default: 0
    t.boolean  "sale",                                          default: false
    t.string   "slug"
    t.datetime "deleted_at"
    t.string   "permalink"
    t.integer  "prototype_id"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.text     "description_markup"
    t.text     "product_keywords"
    t.integer  "shipping_category_id"
  end

  add_index "products", ["shipping_category_id"], name: "index_products_on_shipping_category_id", using: :btree
  add_index "products", ["shop_id"], name: "index_products_on_shop_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "properties", force: true do |t|
    t.string  "identifing_name",                null: false
    t.string  "display_name"
    t.boolean "active",          default: true
    t.integer "shop_id"
  end

  add_index "properties", ["shop_id"], name: "index_properties_on_shop_id", using: :btree

  create_table "prototype_properties", force: true do |t|
    t.integer "prototype_id", null: false
    t.integer "property_id",  null: false
    t.integer "shop_id"
  end

  add_index "prototype_properties", ["property_id"], name: "index_prototype_properties_on_property_id", using: :btree
  add_index "prototype_properties", ["prototype_id"], name: "index_prototype_properties_on_prototype_id", using: :btree
  add_index "prototype_properties", ["shop_id"], name: "index_prototype_properties_on_shop_id", using: :btree

  create_table "prototypes", force: true do |t|
    t.string  "name",                   null: false
    t.boolean "active",  default: true, null: false
    t.integer "shop_id"
  end

  add_index "prototypes", ["shop_id"], name: "index_prototypes_on_shop_id", using: :btree

  create_table "purchase_order_variants", force: true do |t|
    t.integer  "purchase_order_id",                                         null: false
    t.integer  "variant_id",                                                null: false
    t.integer  "quantity",                                                  null: false
    t.decimal  "cost",              precision: 8, scale: 2,                 null: false
    t.boolean  "is_received",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "purchase_order_variants", ["purchase_order_id"], name: "index_purchase_order_variants_on_purchase_order_id", using: :btree
  add_index "purchase_order_variants", ["shop_id"], name: "index_purchase_order_variants_on_shop_id", using: :btree
  add_index "purchase_order_variants", ["variant_id"], name: "index_purchase_order_variants_on_variant_id", using: :btree

  create_table "purchase_orders", force: true do |t|
    t.integer  "supplier_id",                                                null: false
    t.string   "invoice_number"
    t.string   "tracking_number"
    t.string   "notes"
    t.string   "state"
    t.datetime "ordered_at",                                                 null: false
    t.date     "estimated_arrival_on"
    t.decimal  "total_cost",           precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "purchase_orders", ["shop_id"], name: "index_purchase_orders_on_shop_id", using: :btree
  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id", using: :btree
  add_index "purchase_orders", ["tracking_number"], name: "index_purchase_orders_on_tracking_number", using: :btree

  create_table "sales", force: true do |t|
    t.integer  "shop_id"
    t.integer  "product_id"
    t.decimal  "percent_off", precision: 8, scale: 2, default: 0.0
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["product_id"], name: "index_sales_on_product_id", using: :btree
  add_index "sales", ["shop_id"], name: "index_sales_on_shop_id", using: :btree

  create_table "search_suggestions", force: true do |t|
    t.integer  "popularity"
    t.string   "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
  end

  add_index "search_suggestions", ["shop_id"], name: "index_search_suggestions_on_shop_id", using: :btree

  create_table "shipping_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "shipping_categories", ["shop_id"], name: "index_shipping_categories_on_shop_id", using: :btree

  create_table "shipping_methods", force: true do |t|
    t.integer  "shop_id"
    t.string   "name",                            null: false
    t.integer  "shipping_zone_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",           default: true
  end

  add_index "shipping_methods", ["shipping_zone_id"], name: "index_shipping_methods_on_shipping_zone_id", using: :btree
  add_index "shipping_methods", ["shop_id"], name: "index_shipping_methods_on_shop_id", using: :btree

  create_table "shipping_rate_types", force: true do |t|
    t.integer  "shop_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_rate_types", ["shop_id"], name: "index_shipping_rate_types_on_shop_id", using: :btree

  create_table "shipping_rates", force: true do |t|
    t.integer  "shop_id"
    t.integer  "shipping_method_id",                                           null: false
    t.decimal  "rate",                  precision: 8, scale: 2, default: 0.0,  null: false
    t.integer  "shipping_rate_type_id",                                        null: false
    t.integer  "shipping_category_id",                                         null: false
    t.decimal  "minimum_charge",        precision: 8, scale: 2, default: 0.0,  null: false
    t.integer  "position"
    t.boolean  "active",                                        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_rates", ["shipping_category_id"], name: "index_shipping_rates_on_shipping_category_id", using: :btree
  add_index "shipping_rates", ["shipping_method_id"], name: "index_shipping_rates_on_shipping_method_id", using: :btree
  add_index "shipping_rates", ["shipping_rate_type_id"], name: "index_shipping_rates_on_shipping_rate_type_id", using: :btree
  add_index "shipping_rates", ["shop_id"], name: "index_shipping_rates_on_shop_id", using: :btree

  create_table "shipping_zones", force: true do |t|
    t.string   "name",       null: false
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_zones", ["shop_id"], name: "index_shipping_zones_on_shop_id", using: :btree

  create_table "shop_themes", force: true do |t|
    t.integer  "theme_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "shop_id"
    t.boolean  "applied_theme", default: false
    t.boolean  "enable_slider", default: false
  end

  add_index "shop_themes", ["shop_id"], name: "index_shop_themes_on_shop_id", using: :btree
  add_index "shop_themes", ["theme_id"], name: "index_shop_themes_on_theme_id", using: :btree

  create_table "shops", force: true do |t|
    t.string   "email",                                             default: "",    null: false
    t.string   "encrypted_password",                                default: "",    null: false
    t.string   "name"
    t.text     "about"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "work_number"
    t.string   "twitter_username"
    t.string   "facebook_page_url"
    t.string   "linkedin"
    t.string   "rss"
    t.string   "google_plus"
    t.string   "skype"
    t.string   "flickr"
    t.decimal  "shops",                    precision: 10, scale: 0
    t.decimal  "account_balance",          precision: 10, scale: 0, default: 0,     null: false
    t.datetime "next_renewal_at"
    t.string   "state"
    t.string   "title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "bank_name"
    t.string   "account_number"
    t.string   "account_name"
    t.text     "privacy"
    t.text     "terms"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.boolean  "tax_per_state_id",                                  default: true
    t.boolean  "vat",                                               default: false
    t.boolean  "require_state_in_address",                          default: true
  end

  add_index "shops", ["email"], name: "index_shops_on_email", unique: true, using: :btree
  add_index "shops", ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true, using: :btree

  create_table "slides", force: true do |t|
    t.string   "url"
    t.string   "description",              limit: 500
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.string   "link_url"
    t.string   "video_url"
    t.string   "title"
    t.integer  "shop_id"
  end

  add_index "slides", ["shop_id"], name: "index_slides_on_shop_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",                                      null: false
    t.string   "abbreviation",     limit: 5,                null: false
    t.string   "described_as"
    t.integer  "country_id",                                null: false
    t.integer  "shipping_zone_id",                          null: false
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                     default: true
  end

  add_index "states", ["abbreviation"], name: "index_states_on_abbreviation", using: :btree
  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree
  add_index "states", ["shop_id"], name: "index_states_on_shop_id", using: :btree

  create_table "store_credits", force: true do |t|
    t.integer  "customer_id"
    t.integer  "shop_id"
    t.decimal  "amount",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_credits", ["customer_id"], name: "index_store_credits_on_customer_id", using: :btree
  add_index "store_credits", ["shop_id"], name: "index_store_credits_on_shop_id", using: :btree

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers_emails", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: true do |t|
    t.string   "name",       null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "suppliers", ["shop_id"], name: "index_suppliers_on_shop_id", using: :btree

  create_table "tax_rates", force: true do |t|
    t.integer  "shop_id"
    t.decimal  "percentage", precision: 8, scale: 2, default: 0.0,  null: false
    t.integer  "state_id"
    t.integer  "country_id"
    t.date     "start_date",                                        null: false
    t.date     "end_date"
    t.boolean  "active",                             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_rates", ["shop_id"], name: "index_tax_rates_on_shop_id", using: :btree
  add_index "tax_rates", ["state_id"], name: "index_tax_rates_on_state_id", using: :btree

  create_table "theme_images", force: true do |t|
    t.integer  "theme_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
    t.boolean  "active_image",            default: false
  end

  add_index "theme_images", ["theme_id"], name: "index_theme_images_on_theme_id", using: :btree

  create_table "themes", force: true do |t|
    t.string   "name"
    t.decimal  "price",                    precision: 10, scale: 0
    t.boolean  "public"
    t.boolean  "has_slider"
    t.text     "description"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "theme_image_file_name"
    t.string   "theme_image_content_type"
    t.integer  "theme_image_file_size"
    t.datetime "theme_image_updated_at"
  end

  create_table "transaction_accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "transaction_accounts", ["shop_id"], name: "index_transaction_accounts_on_shop_id", using: :btree

  create_table "transaction_ledgers", force: true do |t|
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.integer  "transaction_id"
    t.integer  "transaction_account_id"
    t.decimal  "tax_amount",             precision: 8, scale: 2, default: 0.0
    t.decimal  "debit",                  precision: 8, scale: 2,               null: false
    t.decimal  "credit",                 precision: 8, scale: 2,               null: false
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "transaction_ledgers", ["accountable_id"], name: "index_transaction_ledgers_on_accountable_id", using: :btree
  add_index "transaction_ledgers", ["shop_id"], name: "index_transaction_ledgers_on_shop_id", using: :btree
  add_index "transaction_ledgers", ["transaction_account_id"], name: "index_transaction_ledgers_on_transaction_account_id", using: :btree
  add_index "transaction_ledgers", ["transaction_id"], name: "index_transaction_ledgers_on_transaction_id", using: :btree

  create_table "transactions", force: true do |t|
    t.string   "type"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

  add_index "transactions", ["shop_id"], name: "index_transactions_on_shop_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",                            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variant_properties", force: true do |t|
    t.integer "variant_id",                  null: false
    t.integer "property_id",                 null: false
    t.string  "description",                 null: false
    t.boolean "primary",     default: false
    t.integer "shop_id"
  end

  add_index "variant_properties", ["property_id"], name: "index_variant_properties_on_property_id", using: :btree
  add_index "variant_properties", ["shop_id"], name: "index_variant_properties_on_shop_id", using: :btree
  add_index "variant_properties", ["variant_id"], name: "index_variant_properties_on_variant_id", using: :btree

  create_table "variants", force: true do |t|
    t.integer  "product_id",                                             null: false
    t.string   "sku",                                                    null: false
    t.string   "name"
    t.decimal  "price",          precision: 8, scale: 2, default: 0.0,   null: false
    t.decimal  "cost",           precision: 8, scale: 2, default: 0.0,   null: false
    t.datetime "deleted_at"
    t.boolean  "master",                                 default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
    t.integer  "image_group_id"
    t.integer  "inventory_id"
  end

  add_index "variants", ["image_group_id"], name: "index_variants_on_image_group_id", using: :btree
  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree
  add_index "variants", ["shop_id"], name: "index_variants_on_shop_id", using: :btree
  add_index "variants", ["sku"], name: "index_variants_on_sku", using: :btree

  create_table "withdrawals", force: true do |t|
    t.decimal  "amount",     precision: 10, scale: 0
    t.integer  "shop_id"
    t.string   "state"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "withdrawals", ["shop_id"], name: "index_withdrawals_on_shop_id", using: :btree

end
