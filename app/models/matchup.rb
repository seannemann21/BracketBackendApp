class Matchup < ApplicationRecord
  has_many :competitor_matchups
  has_many :competitors, through: :competitor_matchups
  belongs_to :round
end
