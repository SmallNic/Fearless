class Post < ActiveRecord::Base
  belongs_to :journey
  has_many :comments

end
