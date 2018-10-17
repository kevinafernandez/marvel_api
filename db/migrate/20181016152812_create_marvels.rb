class CreateMarvels < ActiveRecord::Migration[5.2]
  def change
    create_table :marvels do |t|

      t.timestamps
    end
  end
end
