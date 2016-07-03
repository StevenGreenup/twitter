class User < ActiveRecord::Base

  validates :username, presence: true
  validates :photo_url, presence: true

  has_many :tweets
  acts_as_follower
  acts_as_followable
  has_secure_password

  def timeline
    user_id = following_users.pluck(:id)
    user_id.push(id)
    Tweet.where(user_id: user_id).order("created_at DESC")
  end

end
