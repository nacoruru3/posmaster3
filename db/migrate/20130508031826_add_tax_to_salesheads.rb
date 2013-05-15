class AddTaxToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :tax, :integer
    add_column :salesheads, :currency1, :string
    add_column :salesheads, :price1, :integer
    add_column :salesheads, :currency2, :string
    add_column :salesheads, :price2, :integer
    add_column :salesheads, :currency3, :string
    add_column :salesheads, :price3, :integer
    add_column :salesheads, :currency4, :string
    add_column :salesheads, :price4, :integer
  end
end
