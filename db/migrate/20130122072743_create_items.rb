class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.integer :price
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.string :sho1bun
      t.string :kban

      t.timestamps
    end
  end
end
