require 'csv'    
namespace :department do
  desc "department name and code"
  task read: :environment do
    csv_text = File.read('csv/Time logging.csv')
    csv = CSV.parse(csv_text, :headers => true)
    dep= []
    csv.each do |row|
      dep << row[1]
    end 
    dep.uniq.each do |d|
      Department.create(name: d, code: d[0..2])
    end
  end
end
