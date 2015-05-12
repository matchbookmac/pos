class Order < ActiveRecord::Base
  has_many(:antiques)
end
