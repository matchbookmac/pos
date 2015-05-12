class Antique < ActiveRecord::Base
  belongs_to(:order)
end
