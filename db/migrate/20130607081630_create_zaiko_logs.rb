class CreateZaikoLogs < ActiveRecord::Migration
  def change
    create_table :zaiko_logs do |t|
      t.string :code
      t.integer :value

      t.timestamps
    end
  end
end
