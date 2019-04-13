class Timelog < ApplicationRecord
  validates :employee_id, :department_id, :position_id, :date, :hours_logged,presence: true
end
