lass Category < ApplicationRecord
  has_many :fixpoints

  validates :name, uniqueness: true, presence: true

end
