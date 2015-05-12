class RemoveJoinAddOrderId < ActiveRecord::Migration
  def change
    drop_table(:antiques_orders)

    add_column(:antiques, :order_id, :integer)
  end
end
