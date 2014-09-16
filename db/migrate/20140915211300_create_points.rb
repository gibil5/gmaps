
# jr@oblique:  15/9/14


class CreatePoints < ActiveRecord::Migration
  
  def change
  
    create_table :points do |t|
      t.string :name
      t.integer :map_id
      t.string :type
      t.string :info
      t.integer :lat_dec
      t.integer :lng_dec
      t.string :created_by
      t.string :last_updated_by

      t.timestamps
    end


    add_index :points, [:map_id, :created_at]

  end
end
