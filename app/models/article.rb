class Article < ApplicationRecord
  acts_as_paranoid
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_taggable 
  belongs_to :category
  belongs_to :user
  
  validates_presence_of :name, :description, :body
  
  def category_name
    category.try(:slug)
  end
end
