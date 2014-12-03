require 'spreadsheet'

namespace :db do
  desc "Import Results"
  task :import => :environment do
    list = Spreadsheet.open '/home/dev/Documents/RiLa/ergebnisse/5km.xls'
    sheet1 = list.worksheet 0
		sheet1.each 1 do |row|
		  fullname = row[4].split(',').map(&:strip)
		  name = fullname[0]
		  firstname = fullname[1]
		  finishtime = I18n.l row[10], format: "%H:%M:%S"
		  startnumber = row[3]
		  organisation = row[5]
		  birthyear = row[6]
		  birthyear = birthyear < 15 ? birthyear + 2000 : birthyear + 1900 
		  birthday = Date.new
		  birthday = birthday.change(year: birthyear)
		  puts birthday
		  ak = row[7]
		  gender = (['m', 'M'].include? ak[0,1]) ? "Männlich" : "Weiblich"
		  
		  event = Event.find_by_name("4. Ringelnatzlauf")
		  run = event.runs.find_by_name("5km Lauf")

		  registration = Registration.new(
		  	startnumber: startnumber,
		  	runner_name: name,
		  	runner_firstname: firstname,
		  	runner_organisation: organisation,
		  	runner_date_of_birth: birthday,
		  	runner_gender: gender,
		  	finishtime: finishtime,
		  	run_id: run.id,
		  	event_id: event.id
		  )
		  registration.save(validate: false)
		end
  end
end