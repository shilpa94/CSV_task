class Employee < ApplicationRecord
  validates :name, :email, :phone, presence:true
  validates :email, uniqueness: true
  has_one :employee_designation
  has_one :department, through: :employee_designation
  has_one :position, through: :employee_designation
  has_many :timelogs

  # searchable do
  #   text :name
  #   integer :department do
  #     department.id unless department.blank?
  #   end
  #   integer :position do
  #     position.id unless position.blank?
  #   end
  #   # text :login_date, multiple: true do
  #   #   timelogs.date unless timelogs.blank?
  #   # end
  #   # integer :hours do
  #   #   timelogs.hours_logged unless timelogs.blank?
  #   # end
  # end 
end
