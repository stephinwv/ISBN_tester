def check_through_csv_file
	sample_array = CSV.read('input_isbn_file.csv')

	sample_array = sample_array.shift

	finished_array = []

	sample_array.each do |value|
		if one_big_isbn_function(value[1]) == "true"
			value.push("valid")
		else
			value.push("invalid")
		end
		finished_array.push(value)
	end

end
