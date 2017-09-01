require 'sinatra'
require_relative 'isbn_function.rb'

get '/' do
	erb :index	
end
post '/index' do
	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	redirect '/results?isbn10=' + isbn10 + '&isbn13=' + isbn13
end
get '/results' do
	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	erb :results :locals{:isbn10=>isbn10, :isbn13=>isbn13}
end
post '/results' do
	isbn10 = params[:isbn10]
	isbn13 = params[:isbn13]
	vmessage = params[:vmessage]
	invmessage = params[:invmessage]
	erb :results :locals{:isbn10=>isbn10, :isbn13=>isbn13, :vmessage=>vmessage, :invmessage=>invmessage}
end


