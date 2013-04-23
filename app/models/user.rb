class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:username
  # attr_accessible :title, :body
  has_many :items 
  has_many :currents
  has_many :tokuis
  has_many :sho1buns
  has_many :salesheads
  has_many :salesmeis
end
