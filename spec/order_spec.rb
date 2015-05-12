require 'spec_helper'

describe(Order) do

  it('has many antiques') do
    order = Order.create(purchase_date: Time.now)
    antique = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id: order.id)
    expect(order.antiques).to(eq([antique]))
  end

  it('can find orders within certain date range') do
    order = Order.create(purchase_date: Time.now)
    order1 = Order.create(purchase_date: Time.now)
    order2 = Order.create(purchase_date: Time.now)
    order3 = Order.create(purchase_date: Time.now)
    expect(Order.find_orders(Time.now, Time.new(2015, 12, 28))).to(eq([order, order1, order2, order3]))
  end
  it('returns the cost of an order') do
    order = Order.create(purchase_date: Time.now)
    antique = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id: order.id)
    antique1 = Antique.create(description: "big vase", cost: 0.50, purchased: false, order_id: order.id)
    expect(order.cost).to(eq(46.0))
  end

end
