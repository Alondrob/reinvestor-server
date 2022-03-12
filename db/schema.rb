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

ActiveRecord::Schema.define(version: 2022_03_12_184329) do

  create_table "properties", force: :cascade do |t|
    t.string "state"
    t.string "address"
    t.string "property_type"
    t.string "city"
    t.string "county"
    t.string "neighborhood"
    t.integer "sqft"
    t.float "beds"
    t.float "baths"
    t.integer "price"
    t.float "lat"
    t.float "lon"
    t.string "image"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "purchase_price"
    t.integer "monthly_rent"
    t.integer "annual_rent_appreciation"
    t.integer "annual_property_taxes"
    t.integer "annual_vacancy_rate"
    t.integer "loan_years"
    t.integer "loan_rate"
    t.integer "exit_year"
    t.integer "property_appreciation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
