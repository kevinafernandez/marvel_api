class CreateMarvelParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :marvel_parameters do |t|

      t.timestamps
    end
  end
end
