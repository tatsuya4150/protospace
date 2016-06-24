class Prototype < ActiveRecord::Base
  has_many :images
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }


  validates :catch_copy, :concept, :title, presence: true
end
