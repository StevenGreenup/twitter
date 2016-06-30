class User < ActiveRecord::Base

  has_many :tweets
  acts_as_follower
  acts_as_followable
  has_secure_password
  
end
