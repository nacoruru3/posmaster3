class AddIntchangeToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :change, :integer
  end
end
