class AddInstanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instance, :integer
  end
end
