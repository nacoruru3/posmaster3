class Abc < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :name, :value, :user_id ,:zaiko ,:price ,:cost
end
