class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :journeys,  dependent: :destroy
  has_many :follows,  dependent: :destroy
  has_many :comments,  dependent: :destroy
end
