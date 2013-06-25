class AddUserIdToSho1buns < ActiveRecord::Migration
  def change
    add_column :sho1buns, :user_id, :integer
  end
end
