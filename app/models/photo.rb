class Photo < ApplicationRecord
  mount_uploader :url, PhotoUploader

  belongs_to :fixpoint

  #validates :url, presence: true
end
