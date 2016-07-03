class AddLikesToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :favorites, :integer
  end
end
