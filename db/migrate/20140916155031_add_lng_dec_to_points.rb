class AddLngDecToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lng_dec, :string
  end
end
