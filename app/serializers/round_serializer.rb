class RoundSerializer < ActiveModel::Serializer
  attributes :id
  has_many :matchups, serializer: MatchupSerializer
end
