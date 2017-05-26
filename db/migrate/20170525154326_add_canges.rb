class AddCanges < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :first_name
      t.string :first_name, null: false, default: ""
    end
  end
end
