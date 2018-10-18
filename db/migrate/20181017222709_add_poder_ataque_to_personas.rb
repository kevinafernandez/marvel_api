class AddPoderAtaqueToPersonas < ActiveRecord::Migration[5.2]
  def change
    add_column :personas, :poder_ataque, :integer, :default => 0
  end
end
