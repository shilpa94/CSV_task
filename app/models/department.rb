class Department < ApplicationRecord
  validates :name, :code, presence: true, uniqueness: true
end
