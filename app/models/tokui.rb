class Tokui < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :name, :tokui1bun
end
