class Item < ActiveRecord::Base
  has_many :zaikos
  attr_accessible :code, :kban, :name, :price, :price2, :price3, :price4, :sho1bun  
end
