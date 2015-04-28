class HomeController < ApplicationController
  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/file_storage'
  require 'sinatra'
  require 'logger'

  enable :sessions

  CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"
  
  def user_credentials
    # Build a per-request oauth credential based on token stored in session
    # which allows us to use a shared API client.
    @authorization ||= (
      auth = api_client.authorization.dup
      auth.redirect_uri = to('/oauth2callback')
      auth.update_token!(session)
      auth
    )
  end

  def index
  	client = Google::APIClient.new
  	client_secrets = Google::APIClient::ClientSecrets.load
  end

  before do
  # Ensure user has authorized the app
  	  puts "reaches before"
	  unless user_credentials.access_token || request.path_info =~ /^\/oauth2/
	    redirect to('/oauth2authorize')
	  end
  end

  get '/oauth2authorize' do
    # Request authorization
    redirect user_credentials.authorization_uri.to_s, 303
  end


end


# tasks = client.discovered_api('tasks')
#   	result = client.execute(:api_method => tasks.tasklists.list)