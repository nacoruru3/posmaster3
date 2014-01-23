class AddCostToAbcs < ActiveRecord::Migration
  def change
    add_column :abcs, :cost, :integer
  end
end
