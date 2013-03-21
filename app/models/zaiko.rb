class Zaiko < ActiveRecord::Base
  belongs_to :item
  attr_accessible :code, :name, :value, :item
end
