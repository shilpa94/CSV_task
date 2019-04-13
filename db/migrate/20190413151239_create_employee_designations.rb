class CreateEmployeeDesignations < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_designations do |t|
      t.integer :employee_id
      t.integer :department_id
      t.integer :position_id

      t.timestamps
    end
  end
end
