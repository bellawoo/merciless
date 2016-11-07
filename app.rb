require 'sinatra'

class MercilessApp < Sinatra::Base
	get '/' do
		'Hello world!'
	end
end

MercilessApp.run!