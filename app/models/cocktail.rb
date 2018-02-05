class Cocktail < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name,
    against: [:name],
    using: { tsearch: { prefix: true }}

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, :dependent => :restrict_with_exception
  validates :name, uniqueness: true, presence: true
  has_attachment :photo
  belongs_to :user
end
