class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :goals
  has_many :posts
  has_many :follows

end
