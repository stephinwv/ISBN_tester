require 'sinatra'
require_relative 'isbn_function.rb'
require 'rubygems'
require 'aws-sdk'
require 'csv'
 load "./local_env.rb" 
def send_data_to_s3_bucket
    AWS::S3::Base.establish_connection!(
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']  
    )
    file = File.open(isbn.csv, 'w')
	obj.write(file)
       
       
end


get '/' do
	erb :index	
end
post '/index' do
	isbn = params[:isbn]
	
	puts "#{isbn} is your isbn"
	redirect '/results?isbn=' + isbn
end
get '/results' do

	isbn = params[:isbn]
	
	valid = params[:valid]

	valid = main_isbn(isbn)
	
	puts "Made it to get results, your isbn is #{isbn}, it is #{valid}"
	erb :results, :locals=>{:isbn=> isbn, :valid=> valid}
end
post '/results' do
		puts "RESULT POST #{isbn} is your number, it is #{valid}"
	isbn10 = params[:isbn10]
	
	valid = params[:valid]
	valid = main_isbn(isbn)
	
	erb :results, :locals=>{:isbn=> isbn, :valid=> valid}
	puts "#{isbn10} is your number, it is #{valid}"
	redirect '/index?'
end
get '/index' do
	erb :index
end
get '/isbn.erb' do
 erb :isbn
end

