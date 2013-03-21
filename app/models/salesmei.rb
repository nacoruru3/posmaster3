class Salesmei < ActiveRecord::Base
  belongs_to :saleshead
  belongs_to :item
  attr_accessible :billno, :itemcode, :itemprice, :value
end
