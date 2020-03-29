class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :status, null: false, default: 0, index: true
      t.references :creator, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
