require 'csv'

# :access_key_id => ENV['S3_KEY'],
# :secret_access_key => ENV['S3_SECRET'] 
# bucket => Env[’S3_BUCKET’]
# file => ENV[’S3File’ 

def csv_func2
	write_file = File.open("output_isbn.csv", "w")

	CSV.foreach('isbn.csv') do |row|
		if main_isbn(row[1]).to_s== "true"
			row << ("valid")
				else
			row << ("invalid")
		end
			write_file.puts row[0] + ", " + row[1] + ", " + row[2]
	end
end

# def csv_func
# 	csv_array = []
# 	input = CSV.foreach("isbn.csv")do |row|
		
		# if main_isbn(row[1]).to_s== "true"
		# 	row.push("valid")
		# else
		# 	row.push("invalid")
		# end
		
# 	csv_array.push(row)
# 	end

# 		# csv_array = csv_array[0].split(",")
# 		CSV.open("output_isbn.csv", "w", {:headers=> :first_row, :col_sep => ", \t"}) do |row|
		
# 		csv_array.flatten.push(row)
# 		csv_array.each do |putsrow|
# 			puts putsrow
# 		end




# 		# file = File.new("output_isbn.csv", "r")
# 		# while (crow = file.gets)
#   #   		crow.chomp 
#   #   		list = crow.split(/\n/).flatten!
  			
# 		# .map(&:inspect).join(", ")
# 		# end
# 		# list
	
# 	row.class
# 	puts "row is #{row}"
	
# 	puts "#{csv_array}"

# 	end
	
# end

def main_isbn(isbn_num)
    rem_isbn = isbn_remove(isbn_num)
    if isbn_num.length == 10
         # rem_isbn = isbn_remove(isbn_num)
        
        if character(rem_isbn)==true        
        combined_isbn_ten(rem_isbn)
        
        else
            false
        end
    elsif isbn_num.length == 13
        combined_isbn_13(rem_isbn)
    else
            false
    end
end
			

def isbn_remove(isbn_num)
    isbn_num.gsub!(/[-, ]/,"")
    isbn_num.split(",").map(&:to_i)
    isbn_num
end

def character(isbn_num)
valid =  false	
 	if isbn_num.chop !~ /\D/  
    	valid = true
    else
    	valid = false
    end	
    valid
end 

def length_letter13(isbn_num)
		num = isbn_num.gsub(/[a-z]/, "")
		if num.length == 13
			true
		else
			false
		end
end

def check_last_index10(isbn_num)
	if isbn_num[-1].match(/[0-9xX]/) 
		true
	else
		false
	end
end

def check_sum10(isbn_num)

	valid = false
	sum = 0
	index_pos = 0
	index_count = 1
	isbn = isbn_num.chop

	isbn.length.times do
		sum = sum + isbn_num[index_pos].to_i * index_count
		index_pos += 1
		index_count +=1
	end
	check_digit = sum % 11
		if  check_digit == 10 && isbn_num[-1] == "X" || check_digit == 10 && isbn_num[-1] == "x"
			valid = true
			elsif
				isbn_num[-1].to_i == check_digit
				valid = true
		end
	valid
end		
def check_sum13(isbn_num)
	valid = false
	sum = 0
	index_pos = 0
	index_count = 1
	counter = isbn_num.chop
	counter.length.times do
		if index_pos % 2 == 0
			sum = sum + counter[index_pos].to_i *  1
			else 
				sum = sum + counter[index_pos].to_i * 3
		end
		index_pos += 1
		index_count += 1
	end	
	check_digit = (10 - (sum %10))% 10
		if check_digit == isbn_num[-1].to_i
			valid = true
		end
	valid
end	

def combined_isbn_ten(isbn_num)
#valid = false
	if character(isbn_num) == true
		if check_sum10(isbn_num) == true
			 true
		end
	else
		false
	end
	#valid
end

def combined_isbn_13(isbn_num)
	valid = false
	if length_letter13(isbn_num) == true
		if check_sum13(isbn_num) == true
			valid = true
		end
	else
	valid = false
	end
	valid
end
# csv_func
csv_func2