class CreatePeleas < ActiveRecord::Migration[5.2]
  def change
    create_table :peleas do |t|
      t.references :persona, foreign_key: true
      t.references :character, foreign_key: true
      t.datetime :hora_pelea
      t.boolean :ganador_persona
      t.timestamps
    end
  end
end
