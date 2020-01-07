require "sinatra/activerecord"
require "sinatra"
require "sinatra/flash"
require "./models"

set :database, adapter: 'postgresql', database: 'rumblr'
enable :sessions

class User < ActiveRecord::Base
end

get "/" do
  erb :home

end

get "/signup" do
  @user = User.new
  erb :signup
end

post "/signup" do
  @user = User.new(params)
  if @user.save
    p "#{@user.first_name} is now apart of Rumblr."
  end
    erb :home
end

get "/login" do

     erb :login
end

post '/login' do
    @user = User.find_by(email: params[:email])
    given_password = params[:password]
    if @user.password == given_password
        session[:user_id] = @user.id
        redirect '/social'
    end
end

get '/social' do
  erb :social
end

get '/logout' do
  session.clear
  p 'User successfully logged out'
  redirect '/'
end 