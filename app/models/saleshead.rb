class Saleshead < ActiveRecord::Base
  belongs_to :user
  attr_accessible :billno, :custno, :date, :price, :tokui_id
end
