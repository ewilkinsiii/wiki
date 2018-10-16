class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :user_groups
  has_many :groups, through: :user_groups
  
  def name
   if self.first_name.nil?
     " "
    else
      self.first_name + " " + self.last_name
    end
  end
  
  def self.find_version_author(version)
    find(version.terminator)   
  end
end
