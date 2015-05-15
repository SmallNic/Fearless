class Goal < ActiveRecord::Base
  belongs_to :journey

  validates :details, presence: true

end
