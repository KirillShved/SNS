class FixCanges < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :file
      t.remove :sex
      t.remove :last_name
      t.string :last_name, null: false, default: ""
      t.string :address, null: false, default: ""
    end
  end
end
