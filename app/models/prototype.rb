class Prototype < ActiveRecord::Base
#associations
  has_many :images, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true

  acts_as_taggable

#validates
  validates :catch_copy, :concept, :title, presence: true

  def liked_by(user_id)
    likes.find_by(user_id: user_id)
  end
end

