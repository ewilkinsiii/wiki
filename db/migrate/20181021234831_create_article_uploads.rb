class CreateArticleUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :article_uploads do |t|
      t.text :attachment
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
