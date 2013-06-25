class AddUseridToAbcs < ActiveRecord::Migration
  def change
    add_column :abcs, :user_id, :integer
  end
end
