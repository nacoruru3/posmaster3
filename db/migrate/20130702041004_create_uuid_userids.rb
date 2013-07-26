class CreateUuidUserids < ActiveRecord::Migration
  def change
    create_table :uuid_userids do |t|
      t.string :uuid
      t.string :userid

      t.timestamps
    end
  end
end
