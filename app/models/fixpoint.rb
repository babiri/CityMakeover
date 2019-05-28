class Fixpoint < ApplicationRecord
  has_many :votes
  has_many :photos

  belongs_to :user

  enum category: [:aesthetics, :pollution, :accessibility, :hazard]

  # validates :latitude, presence: true
  # validates :longitude, presence: true

  # validates :category, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :photos
end
