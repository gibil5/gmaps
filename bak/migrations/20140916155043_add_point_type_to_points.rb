class AddPointTypeToPoints < ActiveRecord::Migration
  def change
    add_column :points, :point_type, :string
  end
end
