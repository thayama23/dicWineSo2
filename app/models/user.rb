class User < ApplicationRecord
  has_many :wines
  has_many :favorites, dependent: :destroy
  has_many :favorite_wines, through: :favorite, source: :wine


  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
                    mailRegex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
                    before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }, on: :new

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
       
end
