require 'sinatra'
require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/beer.rb'
require_relative 'models/favourite.rb'
require_relative 'models/user'

enable :sessions # sinatra provides this feature
# gives you a global hash "session to write in"

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in? #this method returns a boolean, must be true or false
    if current_user
      return true
    else
      return false
    end
  end
end
# helpers is global. works on all pages


get '/' do
  erb :login
end

post '/users' do
  user = User.new
  user.name = params[:name]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  session[:user_id] = user.id
  redirect '/beers'
end

get '/beers' do
  @beers = Beer.all
  erb :index
end

get '/beers/new' do
  erb :new
end

get '/beers/:id' do
  # redirect '/login' unless logged_in?
  @beer = Beer.find(params[:id])
  erb :show
end


post '/beers' do
  # add a new record to my dishes table
  beer = Beer.new
  beer.name = params[:name]
  beer.company = params[:company]
  beer.beer_type = params[:beer_type]
  beer.image_url = params[:image_url]
  beer.save
  redirect '/'
end


get '/beers/:id/edit' do
  @beer = Beer.find(params[:id])
  erb :edit
end

put '/beers/:id' do
  # update beer and redirect to home
  beer = Beer.find(params[:id])
  beer.name = params[:name]
  beer.image_url = params[:image_url]
  beer.save
  # redirect '/dishes' + params[:id]
  redirect "/beers/#{params[:id]}"
end

get '/favourite' do
  @beers = current_user.favourites
   erb :favourite
end

post '/favourite' do
fav = Favourite.new
fav.name = params[:name]
fav.company = params[:company]
fav.beer_id = params[:id]
fav.user = current_user
fav.save
redirect '/favourite'
end


get '/login' do
  erb :login
end

post '/session' do
  #check email
  user = User.find_by(email: params[:email])
  #check matching password
  if user && user.authenticate(params[:password])
    # have a user and if the authenticate is true
    session[:user_id] = user.id # just a hash to see who is logged in during the session
    redirect '/beers'
  else
    erb :login
  end
end


delete '/session' do
  # remove the hash from the session
  session[:user_id] = nil
  redirect '/login'
end
