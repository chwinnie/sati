# CLIENT_ID = '493185566856-73qtkagjj4339kioq4pbc8914qk6sl02.apps.googleusercontent.com'
# CLIENT_SECRET = 'CCpN75HD03kAUlGO2kYdgNb9'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
  scope: ['tasks',
    'https://www.googleapis.com/auth/tasks'],
  access_type: 'offline',
  prompt: 'consent'}
end