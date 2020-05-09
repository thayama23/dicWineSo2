class Wine < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_many :comments, dependent: :destroy

  enum taste: {"ライト": 1, "ミディアム": 2, "フル": 3}
  enum ranking: {"残念": 1, "今一": 2, "まーまー": 3, "美味しい！": 4, "最高！": 5}
  mount_uploader :image, ImageUploader

  validates :price, presence: true
end
