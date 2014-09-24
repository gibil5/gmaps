class AddLatDecToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lat_dec, :string
  end
end
