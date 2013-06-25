class ZaikoLog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :value, :user_id, :flg, :kubun
end
