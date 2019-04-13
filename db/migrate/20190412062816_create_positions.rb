class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
