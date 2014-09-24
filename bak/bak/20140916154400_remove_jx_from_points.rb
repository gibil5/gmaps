class RemoveJxFromPoints < ActiveRecord::Migration
  def change
    remove_column :points, :jx, :string
  end
end
