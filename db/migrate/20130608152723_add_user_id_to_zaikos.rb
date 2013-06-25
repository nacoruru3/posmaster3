class AddUserIdToZaikos < ActiveRecord::Migration
  def change
    add_column :zaikos, :user_id, :integer
  end
end
