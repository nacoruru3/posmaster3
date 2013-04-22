class AddUserIdToSalesmeis < ActiveRecord::Migration
  def change
    add_column :salesmeis, :user_id, :integer
  end
end
