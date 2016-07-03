class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text :body
      t.string :picture
      t.timestamps null: false
    end
  end
end
