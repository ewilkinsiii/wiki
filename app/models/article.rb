class Article < ApplicationRecord
  acts_as_paranoid
  is_impressionable :counter_cache => true, :column_name => :impressions_count
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_taggable 
  belongs_to :category
  belongs_to :user
  has_paper_trail on: [:update]
  
  validates_presence_of :name, :description, :body
  
  def category_name
    category.try(:slug)
  end
  
  scope :latest, -> { order("Id DESC") }
  
  def user_name
    user ? user.name : ''
  end
end
