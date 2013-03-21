class CreateSalesmeis < ActiveRecord::Migration
  def change
    create_table :salesmeis do |t|
      t.string :billno
      t.references :saleshead
      t.string :itemcode
      t.references :item
      t.integer :value
      t.integer :itemprice

      t.timestamps
    end
    add_index :salesmeis, :saleshead_id
    add_index :salesmeis, :item_id
  end
end
