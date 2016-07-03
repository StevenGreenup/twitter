class Fixdefaultvalueforfavorites < ActiveRecord::Migration
  def change
    remove_column :tweets, :favorites
    add_column :tweets, :favorites, :integer,  :default => 0

  end
end
