require('spec_helper')

describe(Antique) do

  it('belongs to order') do
    order = Order.create(purchase_date: Time.now)
    antique = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id: order.id)
    expect(antique.order).to(eq(order))
  end

  it('ensures the length of description is at most 25 characters') do
    antique = Antique.new(description: "a".*(30))
    expect(antique.save()).to(eq(false))
  end

  it('ensures the cost of item is at non-negative') do
    antique = Antique.new({description: "a".*(23), cost: -30})
    expect(antique.save()).to(eq(false))
  end

  describe('.inventory') do
    it("returns items not purchased") do
      order = Order.create(purchase_date: Time.now)
      antique = Antique.create(description: "vase", cost: 45.50, purchased: true, order_id:       order.id)
      antique1 = Antique.create(description: "vase", cost: 45.50, purchased: false, order_id:  order.id)
      expect(Antique.inventory).to(eq([antique1]))
    end
  end
end
