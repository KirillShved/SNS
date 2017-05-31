class FixAlbums < ActiveRecord::Migration[5.1]
  def change
    change_table :albums do |t|
      t.remove :description
      t.text :description
      t.string :image_url
    end
  end
end
