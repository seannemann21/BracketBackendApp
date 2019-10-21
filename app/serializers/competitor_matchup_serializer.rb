class CompetitorMatchupSerializer < ActiveModel::Serializer
  has_one :competitor
  has_many :votes
end