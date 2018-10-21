class AddRootToAricles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :root, :boolean, :default => false
  end
end