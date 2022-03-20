class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :synopsis ],
    associated_against: {
      movie: [ :title, :overview, :english_title, :rating ],
      bookmark: [ :comment ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
