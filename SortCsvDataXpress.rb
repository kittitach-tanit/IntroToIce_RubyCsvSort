# Kittitach Pongpairoj (5631211121) , Tanit Suenghataiporn (5631255821)

class XpressSortCsvData
	require 'csv'
	data = CSV.read('data.csv', :headers=>true)
	$name = data['Name']
	$score = data['Score']
	$color = data["Color"]

	print "\n"
	print $name[$score.index($score.min)]
	puts " -> got the minimum score: #{$score.min}"
	print $name[$score.index($score.max)]
	puts " -> got the maximum score: #{$score.max}"
	print "The mean is: "
	puts $score.inject{|a, b| a.to_f + b.to_f}/$score.size

	print "\n"
=begin
	print "The least popular color is: "
	puts $color.group_by{|col| col}.values.min_by(&:size).first
	print "The most popular color is: "
	puts $color.group_by{|col| col}.values.max_by(&:size).first
=end
	colorFreq = $color.group_by{|x| x}.map{|x| x[1].length}
	$color.group_by{|x| x}.map{|x| x[1].length}
	colorWithFreq = Array.new{Array.new(2)}
	colorWithFreq[0] = $color.group_by{|x| x}.map{|x| x[0]}
	colorWithFreq[1] = $color.group_by{|x| x}.map{|x| x[1].length}
	puts "The least popular color is: "
	i = 0
	while (i < colorWithFreq[0].length) do
		if colorWithFreq[1][i] == colorWithFreq[1].min 
			print "\"#{colorWithFreq[0][i]}\" "
		end
		i += 1
	end
	puts "\nThe most popular color is: "
	i = 0
	while (i < colorWithFreq[0].length) do
		if colorWithFreq[1][i] == colorWithFreq[1].max
			print "\"#{colorWithFreq[0][i]}\" "
		end
		i += 1
	end
	print "\n"

	print "\n"
	puts "Listing Names: \n"
	$name.each do |id|
		puts (id<<" ").downcase.gsub(/[a-zA-Z] /){|found| found.upcase}.chomp
	end
end
