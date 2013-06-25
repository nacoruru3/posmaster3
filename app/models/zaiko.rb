class Zaiko < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessible :code, :name, :value, :item, :user_id
end
