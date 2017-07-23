require 'sinatra'
require 'omniauth-twitter'
require 'dotenv'

class MercilessApp < Sinatra::Base
	enable :sessions

	Dotenv.load('secrets.env')

	use OmniAuth::Builder do
		provider :twitter, 'API_KEY', 'API_SECRET'
	end

	get '/' do
		erb :index
	end

	get '/login' do
		redirect to("/auth/twitter")
	end

	get 'auth/twitter/callback' do
		env['omniauth.auth'] ? session[:admin] = true : halt(401, 'Not Authorized')
		"You are now logged in"
	end

	get 'auth/failure' do
		params[:message]
	end

	get 'unfollow' do
		params [:list]
		erb :success
	end
end

MercilessApp.run!