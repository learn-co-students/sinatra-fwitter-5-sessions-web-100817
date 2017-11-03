require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/login' do
    erb :login
  end

  get '/tweet' do
      if session[:user_id]
          erb :tweet
      else
        redirect "/sign-up"
      end
    end

  post '/login' do

    user = User.find_by(:username => params[:username])
    if user !=nil
      session[:user_id] = user.id
    else
      redirect "/signup"
    end
  end

  get '/' do
    @tweets = Tweet.all
    @users = User.all
    erb :index
  end

  get '/tweet' do
    erb :tweet
  end

  post '/tweet' do
    user = User.find_by(:username => params[:username])
    tweet = Tweet.new(:user => user, :status => params[:status])
    tweet.save
    redirect '/'
  end

  get '/user' do
    @users = User.all
    erb :users
  end

  get '/logout' do
    session.destroy
    redirect '/login'
  end
  get '/signup' do

    erb :users
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email])
    @user.save
    redirect '/'
  end

  helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      User.find(sessions[:user_id])
    end
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

end
