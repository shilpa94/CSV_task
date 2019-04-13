class EmployeeDesignation < ApplicationRecord
  belongs_to :employee
  belongs_to :department
  belongs_to :position
end
