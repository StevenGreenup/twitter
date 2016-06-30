class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.text :body
      t.string :picture

      t.timestamps null: false
    end
  end
end
