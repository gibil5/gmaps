class RemoveLatDecFromPoints < ActiveRecord::Migration
  def change
    remove_column :points, :lat_dec, :integer
  end
end
