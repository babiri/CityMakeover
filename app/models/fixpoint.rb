class Fixpoint < ApplicationRecord
  has_many :votes
  has_many :photos

  belongs_to :user

  enum category: [:aesthetics, :pollution, :accessibility, :hazard]

  geocoded_by :address # add geocode by IP
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode

  validates :latitude, presence: true
  validates :longitude, presence: true

  validates :category, presence: true
  validates :user, presence: true
end
