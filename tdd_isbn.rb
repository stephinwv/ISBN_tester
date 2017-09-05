require"minitest/autorun"
require_relative "isbn_function.rb"
class Testisbn < Minitest::Test

    def test_isbn_number10_digits
        isbn_num = "0471958697"
        assert_equal(true,character(isbn_num))
    end

    def test_remove_spaces
		results = isbn_remove('12  3 4 5')
		assert_equal('12345', results)
	end

	def test_remove_hypens
		results = isbn_remove('1-2-3-4-5')
		assert_equal('12345', results)
	end

	def test_remove_hypens_and_spaces
		results = isbn_remove('1-2-3-4-5 6 7 8 9')
		assert_equal('123456789', results)
	end

    def test_isbn_wrong_number_digits10
        isbn_num ="04719589"
        assert_equal(true,character(isbn_num))
    end

    def test_isbn_dashes
        isbn_num ="047-195-86-97"
        assert_equal("0471958697",isbn_remove(isbn_num))
    end

    def test_isbn_number13_digits
    	isbn_num = "9780470059029"
    	assert_equal(true, length_letter13("9780470059029"))
    end

    def test_isbn_letters_13
    	results = length_letter13('123rt56yu125r')
    	assert_equal(false, results)
    end

    def test_ten_length_with_X_true
		results = check_last_index10('123456789X')
		assert_equal(true, results)
	end

    def test_for_letters_in_first_nine
		results = length_letter13('123mng456l456')
		assert_equal(false, results)
	end

	def test_last_index_X
		results = character('1234%6789X')
		assert_equal(false, results)
	end
	def test_check_sum 
		results = check_sum10("0471958697")
		assert_equal(true, results)
	end
	def test_checkx
		results = check_sum10("047191111x")
		assert_equal(false, results)
	end
    def test_checkvx
    	results = check_sum10("877195869x")
    	assert_equal(true, results)
    end
    def test_checkvX
    	results = check_sum10("877195869X")
    	assert_equal(true, results)
    end
 	def test_checksum13
 		results = check_sum13("9780470059029")
 		assert_equal(true, results)
 	end
 	def test_checksum13f
 		results = check_sum13("4780470059029")
 		assert_equal(false, results)
 	end
 	def test_combined10
 		results = combined_isbn_ten("877195869x")
 		assert_equal(true, results)
 	end
 	def test_combined13
 		results = combined_isbn_13("9780470059029")
 		assert_equal(true, results)
 	end
 	def test_combined13f
 		results = combined_isbn_13("4780470059029")
 		assert_equal(false, results)
 	end
 	def test_overall
 		results = main_isbn("877195869x") 
 		assert_equal(true, results)
 	end
 	def test_overall10f
 		results =  main_isbn("047191111x")
 		assert_equal(false, results)
 	end
 	def test_overall13
 		results = main_isbn("9780470059029") 
 		assert_equal(true, results)
 	end
 	def test_overall113f
 		results =  main_isbn("4780470059029")
 		assert_equal(false, results)
 	end
 	def test_valid10
 		results = main_isbn("#%7195869x") 
 		assert_equal(false, results)
 	end
 end
 # # Okay..... from Marv in slack as for homework instructions.
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
