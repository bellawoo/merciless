require 'sinatra'

class MercilessApp < Sinatra::Base
	enable :sessions

	get '/' do
		erb :index
	end

	get '/user' do
		params [:username]
		erb :review
	end

	get 'unfollow' do
		params [:list]
		erb :success
	end
end

MercilessApp.run!