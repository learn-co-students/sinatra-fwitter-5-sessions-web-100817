class CreateTweets < ActiveRecord::Migration[4.2]
  def up
    create_table :tweets do |t|
      t.string :username
      t.string :status
    end
  end

  def down
    drop_table :tweets
  end
end
