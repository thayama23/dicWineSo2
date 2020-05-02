class Wine < ApplicationRecord
  validates :price, presence: true
end
