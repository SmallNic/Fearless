class Post < ActiveRecord::Base
  belongs_to :journey
  has_many :comments,  dependent: :destroy

end
