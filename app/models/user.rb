class User < ApplicationRecord
  has_many :user_brackets
  has_many :brackets, through: :user_brackets
  has_many :votes
  has_many :competitor_matchups, through: :votes
end
