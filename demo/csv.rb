require "csv"

hospital = CSV.read('/home/joe/Downloads/Nursing_Home_Compare_-_General_Information.csv')

singleone = hospital.find do |hos|
		hos[1] =~ /TRISUN CARE CENTER/
end
puts singleone.inspect

