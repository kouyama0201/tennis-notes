class Image < ApplicationRecord
  belongs_to :log, inverse_of: :images
  mount_uploader :image, ImageUploader
end
