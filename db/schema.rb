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

ActiveRecord::Schema.define(version: 20141231203640) do

  create_table "crawlers", force: true do |t|
    t.string   "site_url"
    t.string   "css_box"
    t.string   "css_nome"
    t.string   "css_preco"
    t.string   "css_url"
    t.string   "loja_id"
    t.string   "loja_nome"
    t.string   "categoria_id"
    t.string   "categoria_nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.string "teste"
  end

  create_table "produtos", force: true do |t|
    t.string   "nome"
    t.string   "preco"
    t.string   "url"
    t.string   "loja_id"
    t.string   "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
