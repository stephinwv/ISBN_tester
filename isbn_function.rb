isbn_num = "0471958697"	
def isbn_remove(isbn_num)

    isbn_num.gsub!(/[-, ]/,"")
    # [^0-9A-Za-z] saw someone else use this but I'm not sure yet what it means.
    clean_isbn = isbn_num.split(",").map(&:to_i)
    clean_isbn
    p "#{clean_isbn}"
end
def isbn_length(isbn_num)
     if clean_isbn.length == 10
    	true
    	elsif clean_isbn.length == 13
    	true
    	else
    	false
    end	
end

def check_sum10(isbn_num)
	sum = 0
	clean_isbn.each_with_index do |value,index|
		sum = sum + ((index+1).to_i*value.to_i)

	end
	check_digit = sum % 11
	if check_digit == 10
		clean_isbn << "x"
		digit = "x"
	elsif check_digit == 0
		id <<"0"
		digit = "0"
	else id << check_digit.to_s
		digit = check_digit.to_s
	end
	digit
end			
# I had help with this today and I am trying to understand it 
#but as of yet, I don't, at least not totally.

#on line 22 we are creating a loop through each index position and 
#multiplying each value by the corosponding index position after 
#changing both to an integer do be able to do so.
#lines 26 through 32 are checking the sum of the digits that have 
#been multiplied and applied modulo 11, to see if the modulo of 
#either 1 or x (in an instance of x being substitued for 10) 
#equals the checknum or last digit.
# I'm confused about the << on 31 and 33. I thought that it
# was used to push items in an array, but it doesnt' seem to 
# apply here.... class << self maybe??? But that is confusing 
# as well. My brain hurts tonight so I will work on it tomoroww.
# Okay..... from Marv in slack as for homework instructions.
# copied and pasted to have readily accessible...

# REQUIREMENTS FOR ISBN
# ISBN-10 is made up of 9 digits plus a check digit (which
# may be 'X') and ISBN-13 is made up of 12 digits plus a
# check digit. Spaces and hyphens may be included in a code,
# but are not significant. This means that 9780471486480 is
# equivalent to 978-0-471-48648-0 and 978 0 471 48648 0.
# The check digit for ISBN-10 is calculated by multiplying
# each digit by its position (i.e., 1 x 1st digit, 2 x 2nd
# digit, etc.), summing these products together and taking
# modulo 11 of the result (with 'X' being used if the result
# is 10).
# The check digit for ISBN-13 is calculated by multiplying
# each digit alternately by 1 or 3 (i.e., 1 x 1st digit,
# 3 x 2nd digit, 1 x 3rd digit, 3 x 4th digit, etc.), summing
# these products together, taking modulo 10 of the result
# and subtracting this value from 10, and then taking the
# modulo 10 of the result again to produce a single digit.
# Examples of valid ISBN-13:
# "9780470059029"
# "978-0-13-149505-0"
# "978 0 471 48648 0"
# Examples of valid ISBN-10:
# "0471958697"
# "0-321-14653-0"
# "877195869x"
# Examples of invalid ISBNs:
# "4780470059029"
# "0-321@14653-0"
# "877195x869"
# ""
# " "
# "-"
# Example of how the ISBN-10 sumcheck is calculated:
# first 9 digits of an isbn10: 742139476
# create checksum:
# sum = 1*7 + 2*4 + 3*2 + 4*1 + 5*3 + 6*9 7*4 + 8*7 + 9*6
# sum = 7 + 8 + 6 + 4 + 15 + 54 + 28 + 56 + 54
# sum = 232
# checksum = 232%11
# checksum = 1
# isbn = 7421394761 







