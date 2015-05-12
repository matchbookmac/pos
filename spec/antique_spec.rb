require('spec_helper')

describe(Antique) do

  it('belongs to order') do
    order = Order.create(purchase_date: Time.now)
    antique = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id: order.id)
    expect(antique.order).to(eq(order))
  end
end
