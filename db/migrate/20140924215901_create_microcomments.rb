class CreateMicrocomments < ActiveRecord::Migration
  def change
    create_table :microcomments do |t|
      t.string :content
      t.string :owner

      t.timestamps
    end
  end
end
