class Bracket < ApplicationRecord
  has_many :user_brackets
  has_many :users, through: :user_brackets
  has_many :rounds
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  def rounds_completed
    rounds.select { |round| round.completed == true }.length
  end
end
