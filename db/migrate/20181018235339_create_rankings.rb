class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.references :persona, foreign_key: true
      t.references :character, foreign_key: true
      t.integer :triunfos, :default => 0

      t.timestamps
    end
  end
end
