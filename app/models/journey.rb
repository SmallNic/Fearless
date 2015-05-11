class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :goals,   dependent: :destroy
  has_many :posts,   dependent: :destroy
  has_many :follows,   dependent: :destroy


  validates :fear,
    presence: true,
    length: { maximum: 50, minimum: 2 }

end
