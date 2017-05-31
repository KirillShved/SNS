class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.text :description
      t.references :album

      t.timestamps
    end
  end
end
