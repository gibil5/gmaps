class AddJxToPoints < ActiveRecord::Migration
  def change
    add_column :points, :jx, :string
  end
end
