class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :password_confirmation, presence: true

  extend FriendlyId
  friendly_id :name

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 15
  validates_format_of :name, :with => /^[0-9a-zA-Z_]{1,15}$/i

  # かわいみ〜
  has_many :favoriteships, :dependent => :destroy
  has_many :favorite_posts, :through => :favoriteships, :source => :post
end
