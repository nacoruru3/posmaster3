class Current < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :currency, :name, :user_id
end
