class AddSysdayToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :sysday, :string
  end
end
