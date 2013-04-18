class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :image
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  has_attached_file :image,
  					:styles => { :large => "640x640", :medium => "310x310", :thumb => "200x200" },
  					:convert_options => { :large => "-quality 95", :medium => "-quality 95", :thumb => "-quality 95" },
  					:default_url => "/images/:style/missing.png"

  has_many :favoriteships, :dependent => :destroy
  has_many :favorite_users, :through => :favoriteships, :source => :user
end
