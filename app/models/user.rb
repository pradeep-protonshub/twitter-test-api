class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  with_options dependent: :destroy do
    has_many :authentication_tokens
    has_many :tweets
    has_many :follows
    has_many :followers, through: :follows
    has_many :inverse_followers, class_name: "Follow", :foreign_key => :follower_id
    has_many :following, through: :inverse_followers, source: :user 
  end

  def auth_token
    self.authentication_tokens.last.body
  end
end
