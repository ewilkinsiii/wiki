class AddDeletedAtToParanoiac < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at
    add_column :articles, :deleted_at, :datetime
    add_index :articles, :deleted_at
  end
end
