class Wine < ApplicationRecord
  validates :price, presence: true

  mount_uploader :image, ImageUploader
end
