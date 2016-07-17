class Prototype < ActiveRecord::Base
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }


  validates :catch_copy, :concept, :title, presence: true
end

