class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin], multiple: false)                                          ##
  ############################################################################################ 
 

  acts_as_paranoid
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :comments
  has_many :article_uploads, through: :articles
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
