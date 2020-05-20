class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :wines, through: :labellings
end
