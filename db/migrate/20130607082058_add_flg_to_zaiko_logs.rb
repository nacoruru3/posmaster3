class AddFlgToZaikoLogs < ActiveRecord::Migration
  def change
    add_column :zaiko_logs, :flg, :bool
    add_column :zaiko_logs, :kubun, :integer
  end
end
