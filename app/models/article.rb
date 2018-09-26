class Article < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_taggable 
  belongs_to :category
  belongs_to :user
  
  validates_presence_of :name, :description, :body
end
