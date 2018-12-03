class AddSlackUrlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slackurl, :string
  end
end
