Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
  scope: ['email',
  	'https://www.googleapis.com/auth/tasks'],
  access_type: 'offline',
  prompt: 'consent'}
end