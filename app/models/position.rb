class Position < ApplicationRecord
  validates :name, :code, presence: true, uniqueness: true
  has_many :employee_designations
  has_many :departmets, through: :employee_designations
  has_many :employees, through: :employee_designations
  has_many :timelogs
end
