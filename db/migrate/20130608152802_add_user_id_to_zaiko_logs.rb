class AddUserIdToZaikoLogs < ActiveRecord::Migration
  def change
    add_column :zaiko_logs, :user_id, :integer
  end
end
