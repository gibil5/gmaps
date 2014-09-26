class RemoveLngDecFromPoints < ActiveRecord::Migration
  def change
    remove_column :points, :lng_dec, :integer
  end
end
