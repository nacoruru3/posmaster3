class CreateCurrents < ActiveRecord::Migration
  def change
    create_table :currents do |t|
      t.string :currency
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
