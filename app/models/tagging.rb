class Tagging < ApplicationRecord
  belongs_to :music_album
  belongs_to :tag
end
