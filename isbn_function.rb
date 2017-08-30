
def isbn_remove(isbn_num)
    clean_isbn = isbn_num.gsub!(/[-, ]/,"")
    # [^0-9A-Za-z] saw someone else use this but I'm not sure yet what it means.

end
def isbn_length10(isbn_num)
     clean_isbn.length == 10
    	true
    	elsif clean_isbn.length == 13
    	true
    	else
    	false
    end	
end
def check_sum(isbn_num)
	array = []
	dig = ["0","1","2","3","4","5","6","7","8","9","x"]
	isbn_num.each do |v|
		if dig.include?(v)
			isbn_num == true
			else
				isbn_num == false
		end
	end	
end
