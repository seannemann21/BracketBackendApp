class CompetitorMatchup < ApplicationRecord
  belongs_to :matchup
  belongs_to :competitor
end
