class Follow < ActiveRecord::Base
  belongs_to :journey
  belongs_to :user
end
