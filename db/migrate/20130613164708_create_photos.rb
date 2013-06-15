class CreatePhotos < ActiveRecord::Migration
  def change
   create_table :photos do |t|
    t.integer :album_id
    t.integer :user_id
    t.string :description

    t.string :file
    t.timestamps
   end
  end
end
