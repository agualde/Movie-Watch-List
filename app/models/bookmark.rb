class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :comment ],
  associated_against: {
    movie: [ :title, :overview, :english_title, :rating ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
