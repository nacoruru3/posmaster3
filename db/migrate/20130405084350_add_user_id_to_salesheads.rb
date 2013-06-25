class AddUserIdToSalesheads < ActiveRecord::Migration
  def change
    add_column :salesheads, :user_id, :integer
  end
end
