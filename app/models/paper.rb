class Paper < ApplicationRecord
  validates :title,
            presence: true,
            length: { minimum: 3 }
  validates :venue,
            presence: true,
            length: { minimum: 2 }
  validates :year,
            presence: true,
            numericality: { only_integer: true }
  has_and_belongs_to_many :authors
end
