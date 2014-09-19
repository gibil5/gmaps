class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :map_id
      t.string :point_type
      t.string :info
      t.string :lat_dec
      t.string :lng_dec
      t.string :created_by
      t.string :last_updated_by

      t.timestamps
    end
  end
end
