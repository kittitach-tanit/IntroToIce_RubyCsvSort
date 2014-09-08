# Kittitach Pongpairoj (5631211121) , Tanit Suenghataiporn (5631255821)

class SortCsvData
	require 'csv'
	data = CSV.read('data.csv', :headers=>true)
	$name = data['Name']
	$score = data['Score']
	$color = data["Color"]

	def statScore(range)
		if (range == "min")
			print $name[$score.index($score.min)]
			puts " -> got the minimum score: #{$score.min}"
		elsif (range == "max")
			print $name[$score.index($score.max)]
			puts " -> got the maximum score: #{$score.max}"
		elsif (range == "mean")
			print "The mean is: "
			puts $score.inject{|a, b| a.to_f + b.to_f}/$score.size
		else
			puts "Undefined Command"
		end
	end
	def statColor(range)
=begin
		if (range == "min")
			print "The least popular color is: "
			puts $color.group_by{|col| col}.values.min_by(&:size).first
		elsif (range == "max")
			print "The most popular color is: "
			puts $color.group_by{|col| col}.values.max_by(&:size).first
		else
			puts "Undefined Command"
		end
=end
		colorFreq = $color.group_by{|x| x}.map{|x| x[1].length}
		$color.group_by{|x| x}.map{|x| x[1].length}
		colorWithFreq = Array.new{Array.new(2)}
		colorWithFreq[0] = $color.group_by{|x| x}.map{|x| x[0]}
		colorWithFreq[1] = $color.group_by{|x| x}.map{|x| x[1].length}
		if (range=="min")
			puts "The least popular color is: "
			i = 0
			while (i < colorWithFreq[0].length) do
				if colorWithFreq[1][i] == colorWithFreq[1].min 
					print "\"#{colorWithFreq[0][i]}\" "
				end
			i += 1
			end
			print "\n"
		elsif (range=="max")
			puts "The most popular color is: "
			i = 0
			while (i < colorWithFreq[0].length) do
				if colorWithFreq[1][i] == colorWithFreq[1].max 
					print "\"#{colorWithFreq[0][i]}\" "
				end
			i += 1
			end
			print "\n"
		else
			puts "Undefined Command"
		end
	end
	def modName
		puts "Listing Names: \n"
		$name.each do |id|
			puts (id<<" ").downcase.gsub(/[a-zA-Z] /){|found| found.upcase}.chomp
		end
	end

end

#Running as Exe
if __FILE__ == $0

	run = SortCsvData.new

	print "\n"
	run.statScore("min")
	run.statScore("max")
	run.statScore("mean")
	
	print "\n"
	run.statColor("min")
	run.statColor("max")
	
	print "\n"
	run.modName

	puts "\nPress 'Enter' to continue..."
	gets

end
