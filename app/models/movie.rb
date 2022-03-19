class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :overview, :english_title, :rating ],
  associated_against: {
    # director: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end




