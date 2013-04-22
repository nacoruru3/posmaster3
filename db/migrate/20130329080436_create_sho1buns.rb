class CreateSho1buns < ActiveRecord::Migration
  def change
    create_table :sho1buns do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
