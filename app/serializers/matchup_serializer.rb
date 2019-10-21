class MatchupSerializer < ActiveModel::Serializer
  attributes :id
  has_many :competitor_matchups, serializer: CompetitorMatchupSerializer
end
