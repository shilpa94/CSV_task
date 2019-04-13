require 'csv'    
namespace :employee_designation do
  desc "employee designation details"
  task read: :environment do
    csv_text = File.read('csv/Time logging.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.first(10).each do |row|
      employee_id = Employee.where(:name => row[0]).first.try(:id)
      department_id = Department.where(:name => row[1]).first.try(:id)
      position_id = Position.where(:name => row[2]).first.try(:id)
      EmployeeDesignation.create(employee_id: employee_id, department_id: department_id,position_id: position_id)  
      # puts "emp:#{employee_id}","dep:#{department_id}","pos:#{position_id}"   
    end
  end
end
