class CreateGroupCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :group_categories do |t|
      t.integer :category_id
      t.integer :group_id
      t.timestamps
    end
  end
end
