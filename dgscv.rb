def csv_func
	big_array = [] 
CSV.foreach('input_isbn_file.csv') do |row|
        row.inspect
        stuff = isbn_check(row[1]).to_s
        if stuff == "true"
			stuff = "valid"
		elsif stuff == "false"
			stuff = "invalid"
		else
		end
        row << stuff
        p row
       big_array << row
    CSV.open("output_isbn_file.csv", "w") do |out|.join
		out << big_array
	end
end 
end
