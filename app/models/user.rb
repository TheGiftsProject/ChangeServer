class User < ActiveRecord::Base
  has_many :scores

  attr_accessible :facebook_id, :name, :email
end
