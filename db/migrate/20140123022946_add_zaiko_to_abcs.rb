class AddZaikoToAbcs < ActiveRecord::Migration
  def change
    add_column :abcs, :price, :integer
    add_column :abcs, :zaiko, :integer
  end
end
