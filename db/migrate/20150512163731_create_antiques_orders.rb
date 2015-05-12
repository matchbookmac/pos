class CreateAntiquesOrders < ActiveRecord::Migration
  def change
    create_table(:antiques_orders) do |t|
      t.column(:antique_id, :integer)
      t.column(:order_id, :integer)

      t.timestamps()
    end
  end
end
