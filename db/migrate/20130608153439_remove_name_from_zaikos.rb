class RemoveNameFromZaikos < ActiveRecord::Migration
  def up
    remove_column :zaikos, :name
  end

  def down
    add_column :zaikos, :name, :string
  end
end
