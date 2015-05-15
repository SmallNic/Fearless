class Post < ActiveRecord::Base
  belongs_to :journey
  has_many :comments,  dependent: :destroy

  validates :content, presence: true

end
