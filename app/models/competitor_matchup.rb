class CompetitorMatchup < ApplicationRecord
  belongs_to :matchup
  belongs_to :competitor
  has_many :votes
  has_many :users, through: :votes
end
