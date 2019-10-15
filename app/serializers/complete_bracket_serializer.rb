class CompleteBracketSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_many :rounds, serializer: RoundSerializer
  has_one :creator, serializer: UserSerializer
end
