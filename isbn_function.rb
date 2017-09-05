
def main_isbn(isbn_num)
	if isbn_num.length == 10
		combined_isbn_ten(isbn_num)
	elsif isbn_num.length == 13
		combined_isbn_13(isbn_num)
	else
		false
	end

end
			

def isbn_remove(isbn_num)

#remove spaces and hyphens
    isbn_num.gsub!(/[-, ]/,"")
    #gsub literally returns a copy of str with the all occurrences of pattern 
    #substituted for the second argument. 
 
    isbn_num.split(",").map(&:to_i)
    #.split (',') changes the string to an array, and .map basically maps each posiiton and 
    #(&:to_i) tells when map to also change each to and integer.
    isbn_num
end

def character(isbn_num)

	#Made two functions to do letter check differently based on length
#If it is length 10 it checks only the first 9 characters
#using .chop because the last character CAN be a letter.
	
	
valid =  false	
	
 	if isbn_num.chop !~ /\D/  
    valid = true
		
    	
	
    	
    	else
    	valid = false
    end	
    valid
end 


	
	#deletes all numbers, leaving only letters. If 0 then there are no letters
	# and is true, if there are objects left, then it will fail.
   


def length_letter13(isbn_num)
	#If it is 13 it checks all characters because there can be no letters.

		num = isbn_num.gsub(/[a-z]/, "")
		if num.length == 13
			true
			else
				false
		end
end


def check_last_index10(isbn_num)
	#Checks to see if the item in the last index position is either a single digit # or x.
	if isbn_num[-1].match(/[0-9xX]/) 
		true
		else
			false
	end
end




def check_sum10(isbn_num)

	#Does the check digit calculation for ISBN 10, returns true if valid, false if not.
	#Assigning variables for counters, and valid starts as false.  Will get assigned
	#true only if conditions/calculations are met.
	valid = false
	sum = 0
	index_pos = 0
	index_count = 1
	#Use chop here because we dont use the last character to calculate the check digit.
	isbn = isbn_num.chop
	# p "isbn #{isbn}"
	#Loop length of 9, isbn_num length is 10, we .chop it to 9.
	#Iterates through each index position of the string and multiplies by its position.
	#Index position for ISBN numbers start at 1, not 0.
	#Adds each iteration to total
	isbn.length.times do
		sum = sum + isbn_num[index_pos].to_i * index_count
		index_pos += 1
		index_count +=1

	end
	#Sum and mod 11 gets assigned to check_digit
	check_digit = sum % 11

	# Testing the check digit, if equals 10 and isbn_num ends with 'x' or 'X', its valid.
		# p "isbn_num[-1] #{isbn_num[-1]}"
		if  check_digit == 10 && isbn_num[-1] == "X" || check_digit == 10 && isbn_num[-1] == "x"
			valid = true
			#If check_digit does not equal ten, but matches the last character of isbn_num
			#It is a valid ISBN10.  Convert the last digit of isbn_num to an integer for proper comparison.
			elsif
				isbn_num[-1].to_i == check_digit
				valid = true
		end
	# valid is false if none of the conditions were met.
	#True if the calculations and ISBN is valid.
	valid

end		
def check_sum13(isbn_num)
	

	valid = false
	sum = 0
	index_pos = 0
	index_count = 1
	counter = isbn_num.chop
	# p "counter is #{counter}"
	#alternate between multiplying by 1 and 3
	#If index % 2 equals 0 we have an even number, so multiply by 1
	#Otherwise multiply by 3
	#Add to sum each iteration
	counter.length.times do
		# p "index_pos is #{index_pos}"
		if index_pos % 2 == 0
			sum = sum + counter[index_pos].to_i *  1
			# p "sum is #{sum} sum * 1"

			else 
				sum = sum + counter[index_pos].to_i * 3
				# p "sum is #{sum} sum * 3"
		end
		index_pos += 1
		index_count += 1
		# p "sum is #{sum}"
	end	
	
	check_digit = (10 - (sum %10))% 10
	#Calculates check digit
		if check_digit == isbn_num[-1].to_i
			valid = true

		end
	
	valid
end	
#Runs all functions in order related to ISBN10
#If length_letter10 is true, moves to next line
#If check_last_index10 is true, moves to next line
#If check_sum10 is true, assigns true to valid
#Calls valid, which is false unless all the conditions are met.
def combined_isbn_ten(isbn_num)
	# p "isbn_num is #{isbn_num}"

valid = false
	if character(isbn_num) == true

		# if check_last_index10(isbn_num) == true
			if check_sum10(isbn_num) == true
				valid = true
			end
		# end
	else
		valid = false
	end

	valid
	
end
#Runs all functions in order related to ISBN13
#If length_letter13 is true, moves to next line
#If check_sum13 is true, assigns true to valid
#Calls valid, which gives us false unless all the conditions are met.
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
