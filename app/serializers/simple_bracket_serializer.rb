class SimpleBracketSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_one :creator, serializer: UserSerializer
end
