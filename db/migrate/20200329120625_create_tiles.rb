class CreateTiles < ActiveRecord::Migration[6.0]
  def change
    create_table :tiles do |t|
      t.string :word, null: false
      t.integer :tile_type, null: false, default: 0, index: true
      t.boolean :hit, null: false, default: false
      t.references :game, index: true
      t.timestamps
    end
  end
end
