class Category < ApplicationRecord
  acts_as_paranoid
  has_many :articles, dependent: :destroy
  has_many :group_categories
  has_many :groups, through: :group_categories
  extend FriendlyId
  friendly_id :name, use: :slugged
end
