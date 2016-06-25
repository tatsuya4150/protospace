class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum role: %i(main sub)
end

