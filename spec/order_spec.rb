require 'spec_helper'

describe(Order) do

  it('has many antiques') do
    order = Order.create(purchase_date: Time.now)
    antique = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id: order.id)
    expect(order.antiques).to(eq([antique]))
  end
end
