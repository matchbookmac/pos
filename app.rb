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

patch '/antiques/:id' do
  @antique = Antique.find(params['id'])
  @antique.update(description: params.fetch('description', @antique.description), cost: params.fetch('cost', @antique.cost))
  erb(:antique_info)
end

delete '/antiques/:id' do
  @antique = Antique.find(params['id'])
  @antique.destroy
  redirect to('antiques')
end

get '/orders/new' do
  erb(:order_form)
end

post '/orders/checkout' do
  @order = Order.create(purchase_date: Time.now)
  @ordered_antiques = Antique.find(params['antique_id'])
  @cost = 0
  @ordered_antiques.each do |antique|
    antique.update(purchased: true, order_id: @order.id)
    @cost += antique.cost
  end
  erb(:order_checkout)
end

get '/orders/find' do
  erb(:order_find)
end

post '/orders/find/results' do
  start_date = params['start_date']
  end_date = params['end_date']
  @orders = Order.find_orders(start_date, end_date)
  erb(:order_results)
end

get '/orders' do
  erb(:orders)
end

get '/orders/:id' do
  @order = Order.find(params['id'])
  erb(:order)
end
