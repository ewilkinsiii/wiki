class AddAuthorToVersion < ActiveRecord::Migration[5.0]
  def change
    add_column :versions, :author_name, :string
    add_column :versions, :word_count, :integer
  end
end
