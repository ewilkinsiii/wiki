class Category < ApplicationRecord
  acts_as_paranoid
  has_many :articles, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
end
