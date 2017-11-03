class ModifyTweets < ActiveRecord::Migration[4.2]
  def up
    remove_column :tweets, :username, :string
    add_column :tweets, :user_id, :integer
  end

  def down
    add_column :tweets, :username, :string
    remove_column :tweets, :user_id, :integer
  end
end
