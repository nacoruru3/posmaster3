class CreateTokuis < ActiveRecord::Migration
  def change
    create_table :tokuis do |t|
      t.string :code
      t.string :name
      t.string :tokui1bun

      t.timestamps
    end
  end
end
