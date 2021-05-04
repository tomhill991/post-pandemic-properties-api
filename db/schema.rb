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

ActiveRecord::Schema.define(version: 2021_05_04_024657) do

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "max_guests"
    t.integer "price_per_day"
    t.float "longitude"
    t.float "latitude"
    t.float "average_rating"
    t.boolean "has_beach_nearby"
    t.boolean "has_beds"
    t.boolean "has_kitchen"
    t.boolean "has_swimming_pool"
    t.boolean "has_hdtv"
    t.boolean "has_bathtub"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
