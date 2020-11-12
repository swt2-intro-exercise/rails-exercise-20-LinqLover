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

end
