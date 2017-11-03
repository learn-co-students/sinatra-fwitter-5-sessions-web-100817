require './app/controllers/application_controller'

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "fwitter_secret"
end

run ApplicationController
