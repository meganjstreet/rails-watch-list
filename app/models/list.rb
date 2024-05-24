class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :img_url, presence: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
end
