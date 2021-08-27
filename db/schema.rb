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

ActiveRecord::Schema.define(version: 2021_08_27_130109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canciones", force: :cascade do |t|
    t.string "url_youtube"
    t.string "url_spotify"
    t.string "nombre"
    t.boolean "activo"
    t.bigint "temporada_capitulo_id", null: false
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["temporada_capitulo_id"], name: "index_canciones_on_temporada_capitulo_id"
  end

  create_table "temporada_capitulos", force: :cascade do |t|
    t.integer "num_temporada"
    t.integer "num_capitulo"
    t.boolean "activo"
    t.date "activo_desde"
    t.date "activo_hasta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["num_temporada", "num_capitulo"], name: "index_temporada_capitulos_on_num_temporada_and_num_capitulo", unique: true
  end

  add_foreign_key "canciones", "temporada_capitulos"
end
