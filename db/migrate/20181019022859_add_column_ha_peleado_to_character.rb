class AddColumnHaPeleadoToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :ha_peleado, :boolean, default: false
  end
end
