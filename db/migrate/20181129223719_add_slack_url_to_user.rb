class AddSlackUrlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_url, :string
  end
end
