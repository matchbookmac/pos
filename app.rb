require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/order'
require './lib/antique'
require 'pry'

before() do
  @antiques = Antique.all
  @orders = Order.all
end

get '/reset' do
  Antique.all.each do |antique|
    antique.destroy
  end
  Order.all.each do |order|
    order.destroy
  end
  redirect to('/')
end

get '/' do
  erb(:index)
end

get '/antiques' do
  erb(:antiques)
end

post '/antiques' do
  @antique = Antique.new({description: params['description'], cost: params['cost'], purchased: false})
  if @antique.save()
    erb(:antiques)
  else
    erb(:errors)
  end
end

get '/antiques/:id' do
  @antique = Antique.find(params.fetch('id').to_i)
  erb(:antique_info)
end
