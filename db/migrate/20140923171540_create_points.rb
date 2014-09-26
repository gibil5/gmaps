class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      
      t.integer :map_id

      t.string :point_type
      t.string :point_subtype

      t.string :name
      t.string :lat_dec
      t.string :lng_dec
      t.string :info
      t.string :created_by
      t.string :last_updated_by

      t.string :ad_number
      t.string :ad_street
      t.string :ad_district
      t.string :ad_phone_1
      t.string :ad_phone_2
      t.string :ad_reference

      t.string :open_hours
      
      t.string :email
      t.string :www
      t.string :facebook
      t.string :twitter
      
      t.string :comments

      t.timestamps
    end
  end
end
