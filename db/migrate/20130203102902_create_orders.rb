class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :sheet
      t.string :code
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
