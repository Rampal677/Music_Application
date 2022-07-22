class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :music_albums, through: :taggings
end
