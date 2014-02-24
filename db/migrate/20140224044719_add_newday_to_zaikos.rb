class AddNewdayToZaikos < ActiveRecord::Migration
  def change
    add_column :zaikos, :newday, :string
  end
end
