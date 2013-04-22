class AddUserIdToCurrents < ActiveRecord::Migration
  def change
    add_column :currents, :user_id, :integer
  end
end
