class Owner < ApplicationRecord
  has_many :cars, dependent: :destroy

  # has_many :cars, dependent: :destroy
  # dependent not needed here, because we are going to delete the fav directly
  # on the page but not the cars themselves
  # NOT NEEDED
  # has_many :favourites, through: cars
  # has_many :reviews, through: cars

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10 }
end
