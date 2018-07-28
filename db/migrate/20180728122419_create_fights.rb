class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.references :pirate_a, index: true, foreign_key: {to_table: :pirates}
      t.references :pirate_b, index: true, foreign_key: {to_table: :pirates}
      t.integer :winner, default: 0

      t.timestamps
    end
  end
end
