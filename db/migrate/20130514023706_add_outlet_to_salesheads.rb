class AddOutletToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :outlet, :string
  end
end
