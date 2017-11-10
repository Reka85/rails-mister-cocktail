class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, :dependent => :restrict_with_exception
  validates :name, uniqueness: true, presence: true
  has_attachment :photo
end
