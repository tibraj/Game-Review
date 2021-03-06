class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11}
  validates :content, presence: true
  validates :game, uniqueness: { scope: :user, message: "Error: You've already reviewed this game!"}
end
