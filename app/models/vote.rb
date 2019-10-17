class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :competitor_matchup
end
