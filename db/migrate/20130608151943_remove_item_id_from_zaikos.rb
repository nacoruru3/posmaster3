class RemoveItemIdFromZaikos < ActiveRecord::Migration
  def up
    remove_column :zaikos, :item_id
  end

  def down
    add_column :zaikos, :item_id, :integer
  end
end
