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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130201054602) do

  create_table "contacters", :force => true do |t|
    t.string   "contacterName"
    t.string   "addressRegion"
    t.string   "detailedAddress"
    t.string   "company"
    t.string   "contactNum"
    t.string   "cellphoneNum"
    t.string   "email"
    t.integer  "postalCode"
    t.integer  "validFlag"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "orderDispNum"
    t.integer  "orderState"
    t.string   "expressNum"
    t.integer  "senderID"
    t.integer  "receiverID"
    t.datetime "orderDate"
    t.string   "orderContent"
    t.integer  "posterID"
    t.datetime "estimateTermDate"
    t.string   "servicePoints"
    t.string   "serviceSuggest"
    t.string   "serviceProcess"
    t.integer  "expressProvider"
    t.integer  "shipmentType"
    t.string   "specialHandling"
    t.integer  "paymentType"
    t.string   "specialOffer"
    t.string   "userNote"
    t.string   "posterNote"
    t.integer  "weight"
    t.string   "volume"
    t.integer  "charge"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
