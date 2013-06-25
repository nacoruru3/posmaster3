class AddItemnameToSalesmeis < ActiveRecord::Migration
  def change
    add_column :salesmeis, :itemname, :string
  end
end
