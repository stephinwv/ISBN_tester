def isbn_remove(isbn_num)
    isbn_num.gsub(/[-, ]/,"")
end
def isbn_length10(isbn_num)
     isbn_num.length == 10
    # 	isbn_num = true
    # 	elsif isbn_num.length == 13
    # 	isbn_num = true
    # 	else
    # 	isbn_num = false
    # end	
end
def isbn_length13(isbn_num)
	isbn_num.length == 13
end
