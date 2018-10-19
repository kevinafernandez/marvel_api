class AddNewColumnsToPersonas < ActiveRecord::Migration[5.2]
  def change
  	add_column :personas, :puntos_acumulados, :integer, :default => 0
  	add_column :personas, :peleas_ganadas_dia, :integer, :default => 0
  	add_column :personas, :esta_vivo, :boolean, default: true
  end
end
