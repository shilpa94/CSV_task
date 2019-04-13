class Employee < ApplicationRecord
  validates :name, :email, :phone, presence:true
  validates :email, uniqueness: true
  has_one :employee_designation
  has_one :department, through: :employee_designation
  has_one :position, through: :employee_designation
end
