class CreatePirates < ActiveRecord::Migration[5.1]
  def change
    create_table :pirates do |t|
      t.string :name
      t.integer :hp
      t.integer :dmg

      t.timestamps
    end
  end
end
