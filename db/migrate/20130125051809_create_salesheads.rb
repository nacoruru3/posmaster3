class CreateSalesheads < ActiveRecord::Migration
  def change
    create_table :salesheads do |t|
      t.string :billno
      t.integer :price
      t.string :date
      t.string :custno
      t.integer :tokui_id

      t.timestamps
    end
  end
end
