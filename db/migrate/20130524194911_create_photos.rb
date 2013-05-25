class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :caption
      t.integer :album_id
      t.integer :user_id
      t.string  :image
    end
  end
end
