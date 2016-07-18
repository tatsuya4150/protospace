class Prototype < ActiveRecord::Base
#associations
  has_many :images
  belongs_to :user
  has_many :likes

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

#validates
  validates :catch_copy, :concept, :title, presence: true
end

