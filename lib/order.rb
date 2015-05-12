class Order < ActiveRecord::Base
  has_many(:antiques)
  scope :find_orders, -> (start_date, end_date) { where("purchase_date >= ? and purchase_date <= ?", start_date,  end_date) }
  scope :inventory, -> { where(purchased: false) }

  def cost
    antiques = Antique.where(order_id: id)
    cost = 0
    antiques.each do |antique|
      cost += antique['cost'].to_f
    end
    cost
  end

end
