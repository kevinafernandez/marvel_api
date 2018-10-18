class AddColumnToCharacter < ActiveRecord::Migration[5.2]
	#Agrega columna a Character y se eliminan tablas innecesarias.
  def change
    add_column :characters, :name, :string
  end
end
