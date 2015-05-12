require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/order'
require './lib/antique'
require 'pry'

get '/' do
  erb(:index)
end
