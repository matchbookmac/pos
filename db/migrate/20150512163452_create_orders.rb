class CreateOrders < ActiveRecord::Migration
  def change
    create_table(:orders) do |t|
      t.column(:purchase_date, :date)

      t.timestamps()
    end
  end
end
