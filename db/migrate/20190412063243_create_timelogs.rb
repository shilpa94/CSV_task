class CreateTimelogs < ActiveRecord::Migration[5.2]
  def change
    create_table :timelogs do |t|
      t.integer :employee_id
      t.integer :department_id
      t.integer :position_id
      t.string :date
      t.integer :hours_logged

      t.timestamps
    end
  end
end
