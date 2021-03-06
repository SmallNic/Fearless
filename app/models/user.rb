class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :journeys,  dependent: :destroy
  has_many :follows,  dependent: :destroy
  has_many :comments,  dependent: :destroy

  #a user (aka the follower) has many active relationships of the type Relationship, and in the relationship table, the user's id (aka the follower_id) is the foreign key
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy

  #a user (aka the followed person) has many passive relationships of the type Relationship, and in the relationship table, the user's id (aka the followed_id) is the foreign key
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  #a user follows many users through an active relationship, and the source is...
  has_many :following, through: :active_relationships, source: :followed

  #a user has many followers through a passive relationship, and the source is...
  has_many :followers, through: :passive_relationships, source: :follower

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the user in the argument.
  def following?(other_user)
    following.include?(other_user)
  end

end
