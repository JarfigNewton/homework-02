class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships

  def information
    "#{title} by #{authors.map(&:full_name).join(', ')}"
  end
end
