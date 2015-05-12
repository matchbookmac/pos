class CreateAntiques < ActiveRecord::Migration
  def change
    create_table(:antiques) do |t|
      t.column(:description, :string)
      t.column(:cost, :float)
      t.column(:purchased, :boolean)

      t.timestamps()
    end
  end
end
