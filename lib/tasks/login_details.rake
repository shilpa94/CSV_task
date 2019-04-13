require 'csv'    
namespace :login_details do
  desc "employee login details"
  task read: :environment do
    csv_text = File.read('csv/Time logging.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      employee_id = Employee.where(:name => row[0]).first.try(:id)
      department_id = Department.where(:name => row[1]).first.try(:id)
      position_id = Position.where(:name => row[2]).first.try(:id)
      Timelog.create(employee_id: employee_id, department_id: department_id,position_id: position_id, date: row[3], hours_logged: row[4])     
    end
  end
end
