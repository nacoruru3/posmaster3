class AddFlgToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :flg, :bool
  end
end
