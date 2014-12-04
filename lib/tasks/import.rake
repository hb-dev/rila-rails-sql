require 'spreadsheet'

namespace :db do
  desc "Import Results"
  task :import => :environment do
    table = Spreadsheet.open Rails.root.join('app/assets/spreadsheets/results/', 'results.xls')
    table.worksheets.each do |worksheet|
			worksheet.each 1 do |row|

				event = Event.find_by_name("4. Ringelnatzlauf")
				run_name = get_run_name(worksheet.name)
				run = event.runs.find_by_name(run_name)

				case worksheet.name
				when 'Staffel'

				when 'minis'
				  fullname = split_fullname(row[1])
				  name = fullname[0]
				  firstname = fullname[1]
				  startnumber = row[0]
				  organisation = row[3]
				  birthday = "2010-01-01"
				  gender = get_gender(row[2])	
				  registration = Registration.new(
				  	startnumber: startnumber,
				  	runner_name: name,
				  	runner_firstname: firstname,
				  	runner_organisation: organisation,
				  	runner_date_of_birth: birthday,
				  	runner_gender: gender,
				  	run_id: run.id,
				  	event_id: event.id
				  )
				  registration.save(validate: false)				  
				else					
				  fullname = split_fullname(row[1])
				  name = fullname[0]
				  firstname = fullname[1]
				  finishtime = I18n.l row[5], format: "%H:%M:%S"
				  startnumber = row[0]
				  organisation = row[2]
				  birthday = calculate_birthday(row[3])
				  gender = get_gender(row[4])								  

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
  end

  def calculate_birthday(birthyear)
	  birthyear = birthyear < 15 ? birthyear + 2000 : birthyear + 1900 
	  birthday = Date.new
	  birthday = birthday.change(year: birthyear)
  end

  def get_gender(ak)
		(['m', 'M'].include? ak[0,1]) ? "Männlich" : "Weiblich"
  end

	def split_fullname(fullname)
		fullname.split(',').map(&:strip)
	end

  def get_run_name(worksheet_name)
		case worksheet_name
		when "10km"
			run_name = "10km Lauf - Einzelstarter"
		when "5km"
			run_name = "5km Lauf"
		when "Walking"
			run_name = "5km Walking / N. Walking"
		when "1,2km"
			run_name = "1,2km Kinderlauf (6-8 Jahre)"
		when "2,4km"
			run_name = "2,4km Kinderlauf (9-10 Jahre)"
		when "3,6km"
			run_name = "3,6km Kinderlauf (11-12 Jahre)"					
		when "Staffel"
			run_name = "10km Lauf - Staffel (4x2,5km)"
		when "minis"
			run_name = "200m Minilauf (3-5 Jahre)"
		end
  end

end