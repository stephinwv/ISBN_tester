require 'csv'

def csv_func

	input = CSV.read("isbn.csv")

	input.shift

	csv_array = []

	input.each do |row|
		if main_isbn(row[1]).to_s== "true"
			row.push("valid")
		else
			row.push("invalid")
		end
		csv_array.push(row)
		
		CSV.open("output_isbn.csv", "w", {headers: false, :row_sep => "\r\n", :col_sep => ", "}) do |out|
		
		out << csv_array.flatten!


		end

	end
csv_array
end

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
csv_func