class SessionsController < ApplicationController
	layout false

	def new
	end

	def create
		@request = request
		@auth = request.env['omniauth.auth']['credentials']
	end
end
