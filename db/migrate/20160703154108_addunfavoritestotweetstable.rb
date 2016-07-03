class Addunfavoritestotweetstable < ActiveRecord::Migration
  def change
    add_column :tweets, :unfavorites, :integer,  :default => 0
  end
end
