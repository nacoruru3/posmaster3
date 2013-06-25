class AddSysdayToSalesmeis < ActiveRecord::Migration
  def change
    add_column :salesmeis, :sysday, :string
    add_column :salesmeis, :date, :string
  end
end
