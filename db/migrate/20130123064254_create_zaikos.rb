class CreateZaikos < ActiveRecord::Migration
  def change
    create_table :zaikos do |t|
      t.references :item
      t.string :name
      t.string :code
      t.integer :value

      t.timestamps
    end
    add_index :zaikos, :item_id
  end
end
