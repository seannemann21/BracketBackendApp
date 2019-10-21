class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :competitor_matchup
  has_one :competitor, through: :competitor_matchup
  has_one :matchup, through: :competitor_matchup
end
