class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  validates :name, presence: true, length: { in: 3..25 }
  validates :brand, presence: true, length: { in: 3..25 }
  validates :image, presence: true
  validates :lending_fee, presence: true, length: { in: 1..1000 }, numericality: { only_integer: true }
  validates :description, presence: true, length: { in: 5..1000 }
end
