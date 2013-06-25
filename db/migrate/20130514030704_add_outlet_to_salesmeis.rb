class AddOutletToSalesmeis < ActiveRecord::Migration
  def change
    add_column :salesmeis, :outlet, :string
  end
end
