class User < ActiveRecord::Base
  has_many :games

  attr_accessible :facebook_id, :name, :email
end
