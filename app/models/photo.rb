class Photo < ApplicationRecord
  belongs_to :fixpoint

  validates :photo, presence: true
end
