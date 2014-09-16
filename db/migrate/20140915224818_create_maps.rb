class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :map_type
      t.string :created_by
      t.string :last_updated_by
      t.string :comments

      t.timestamps
    end
  end
end
