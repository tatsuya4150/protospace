class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader

  has_many :prototypes
  has_many :comments
  has_many :likes
end

