class Sho1bun < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :name
end
