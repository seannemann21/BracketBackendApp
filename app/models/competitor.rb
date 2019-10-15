class Competitor < ApplicationRecord
  has_many :competitor_matchups
  has_many :matchups, through: :competitor_matchups
end
