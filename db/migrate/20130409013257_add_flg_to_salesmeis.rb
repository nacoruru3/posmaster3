class AddFlgToSalesmeis < ActiveRecord::Migration
  def change
    add_column :salesmeis, :flg, :bool
  end
end
