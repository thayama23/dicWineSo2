class Wine < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  enum taste: {"該当なし": 0, "ライト": 1, "ミディアム": 2, "フル": 3}
  enum ranking: {"無評価": 0, "残念": 1, "今一": 2, "まーまー": 3, "美味しい！": 4, "最高！": 5}
  mount_uploader :image, ImageUploader

  validates :price, presence: true
end
