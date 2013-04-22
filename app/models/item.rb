class Item < ActiveRecord::Base
  belongs_to :user
  has_many :zaikos
  attr_accessible :code, :kban, :name, :price, :price2, :price3, :price4, :sho1bun ,:user_id
end
