class Author < ApplicationRecord
  validates :first_name,
            presence: true,
            length: { minimum: 2 }
  validates :last_name,
            presence: true,
            length: { minimum: 2 }
  validates :homepage,
            presence: true,
            format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  has_and_belongs_to_many :papers

  def name
    "#{first_name} #{last_name}"
  end
end
