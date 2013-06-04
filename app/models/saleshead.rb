class Saleshead < ActiveRecord::Base
  belongs_to :user
  attr_accessible :billno, :custno, :date, :price, :tokui_id ,:tax ,:currency1 ,:currency2 ,:currency3 ,:currency4 ,:price1 ,:price2 ,:price3 ,:price4 ,:change ,:outlet ,:sysday
end
