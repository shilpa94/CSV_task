require 'csv'    
namespace :position do
  desc "position name and code"
  task read: :environment do
    csv_text = File.read('csv/Time logging.csv')
    csv = CSV.parse(csv_text, :headers => true)
    position = []
    csv.each do |row|
      position << row[2]
    end 
    position.uniq.each do |p|
      result = p.split.map(&:first).join + p[-1]
      Position.create(name: p, code: result)
    end
  end
end
