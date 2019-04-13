require 'csv'    
namespace :employee_details do
  desc "employee details"
  task read: :environment do
    csv_text = File.read('csv/employee.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
       Employee.create(name: row[0], email:row[1], phone: row[2])
    end
  end
end

# rake "employee_details:read"
