class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :fixpoint

  validates :url, presence: true
end
