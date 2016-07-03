class Tweet < ActiveRecord::Base

  belongs_to :user

  def scorefavorite
  favorites - unfavorites
  end
end
