require "sinatra"
require "sinatra/reloader"
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
require_relative 'models/pokemon'

#This is the index page
get "/" do
  @pokemons = Pokemon.all
     erb :"pokemons/index"
end

get '/pokemons/new' do
     erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

get "/pokemons/:id/edit" do
  @pokemons = Pokemon.find(params[:id])
  erb(:"pokemons/edit")
end
