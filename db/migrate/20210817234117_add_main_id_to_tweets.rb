class AddMainIdToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :main_id, :integer
  end
end
