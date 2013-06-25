class AddTelToTokuis < ActiveRecord::Migration
  def change
    add_column :tokuis, :tel, :string
    add_column :tokuis, :kake, :string
    add_column :tokuis, :tankakubun, :string
  end
end
