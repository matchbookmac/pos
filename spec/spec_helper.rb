ENV['RACK_ENV'] = 'test'

require 'sinatra/activerecord'
require 'rspec'
require 'pg'
require 'order'
require 'antique'
require 'pry'


RSpec.configure do |config|
  config.after(:each) do
    Order.all().each() do |order|
      order.destroy()
    end
    Antique.all().each() do |antique|
      antique.destroy()
    end
  end
end
