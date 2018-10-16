class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_categories
  has_many :categories, through: :group_categories
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
