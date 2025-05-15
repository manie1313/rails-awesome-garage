class Review < ApplicationRecord
  belongs_to :car
  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :comment, presence: true, length: { maximum: 100 }
  # validates :car_id
end
