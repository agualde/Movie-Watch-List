class List < ApplicationRecord
  has_one_attached :photo

  validates :photo, size: { between: 1.kilobyte..5.megabytes , message: 'size is too big (max 5MB)' }, content_type: ['image/png', 'image/jpeg']

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
 
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name ],
  associated_against: {
    bookmarks: [ :comment ],
    movies: [ :title, :overview, :english_title, :rating ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
