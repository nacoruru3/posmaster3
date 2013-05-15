class AddEdaToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :eda, :integer
  end
end
