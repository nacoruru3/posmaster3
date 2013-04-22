class AddLoginIdToTokuis < ActiveRecord::Migration
  def change
    add_column :tokuis, :user_id, :integer
  end
end
