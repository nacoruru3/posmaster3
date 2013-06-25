class Order < ActiveRecord::Base
  attr_accessible :code, :name, :price, :sheet
end
