class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :fixpoint
  validates :user, uniqueness: { scope: :fixpoint }
end
