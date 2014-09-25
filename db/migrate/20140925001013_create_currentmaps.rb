class CreateCurrentmaps < ActiveRecord::Migration
  def change
    create_table :currentmaps do |t|
      t.string :id_curr

      t.timestamps
    end
  end
end
