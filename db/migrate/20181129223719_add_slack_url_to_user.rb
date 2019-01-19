class AddSlackUrlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_url, :string
    add_column :users, :roles, :string
  end
end
