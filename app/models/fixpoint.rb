class Fixpoint < ApplicationRecord
  has_many :votes
  has_many :photos

  belongs_to :category
  belongs_to :user

  validates :latitude, presence: true
  validates :longitude, presence: true
end
