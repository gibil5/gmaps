class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :info
      t.string :lat_dec
      t.string :long_dec

      t.timestamps
    end
  end
end
