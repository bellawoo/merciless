require 'sinatra'

class MercilessApp < Sinatra::Base
	enable :sessions

	get '/' do
		erb :index
	end

	get '/user' do
		params [:username]
	end
end

MercilessApp.run!