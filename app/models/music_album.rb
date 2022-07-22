class MusicAlbum < ApplicationRecord
  has_one_attached :cover_image
  has_one_attached :file
  validates :name, :cover_image, :description, :file, :price, presence: true
  scope :published, -> { where(publish: true) }
  scope :unpublished, -> { where(publish: false) }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
