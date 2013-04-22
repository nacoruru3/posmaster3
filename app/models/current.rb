class Current < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :currency, :name
end
