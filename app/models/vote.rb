class Vote < ApplicationRecord
  belongs_to :fixpoint
  belongs_to :user

  validates :user, presence: true
  validates :fixpoint, presence: true

end
