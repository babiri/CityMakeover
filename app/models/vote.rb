class Vote < ApplicationRecord
  belongs_to :fixpoints
  belongs_to :users

end
