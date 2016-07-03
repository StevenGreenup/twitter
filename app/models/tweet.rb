class Tweet < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  def scorefavorite
  favorites - unfavorites
  end
end
