class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
 
  
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ ],
  associated_against: {
    bookmarks: [ :comment ],
    movies: [ :title, :overview, :english_title, :rating ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
