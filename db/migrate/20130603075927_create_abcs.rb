class CreateAbcs < ActiveRecord::Migration
  def change
    create_table :abcs do |t|
      t.string :code
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
