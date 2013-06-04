class Salesmei < ActiveRecord::Base
  belongs_to :saleshead
  belongs_to :item
  belongs_to :user
  attr_accessible :billno, :itemcode, :itemprice, :value, :outlet ,:sysday ,:date
end
