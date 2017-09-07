require 'sinatra'
require_relative 'isbn_function.rb'

get '/' do
	erb :index	
end
post '/index' do
	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	puts "#{isbn10} is your isbn"
	redirect '/results?isbn10=' + isbn10 + '&isbn13=' + isbn13
end
get '/results' do

	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	valid = params[:valid]
	valid = combined_isbn_ten(isbn10)
	valid = combined_isbn_13(isbn13)
	puts "Made it to get results, your isbn is #{isbn10}, it is #{valid}"
	erb :results, :locals=>{:isbn10=> isbn10, :isbn13=> isbn13, :valid=> valid}
end
post '/results' do
		puts "RESULT POST #{isbn10} is your number, it is #{valid}"
	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	valid = params[:valid]
	valid = combined_isbn_ten(isbn_num)
	valid = combined_isbn_13(isbn_num)
	erb :results, :locals=>{:isbn10=> isbn10, :isbn13=> isbn13, :valid=> valid}
	puts "#{isbn10} is your number, it is #{valid}"
	redirect '/index?'
end
get '/index' do
	erb :index
end


