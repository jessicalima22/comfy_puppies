class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
  has_many :adopters, through: :adoptions, source: :user
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # Full-text search
  include PgSearch::Model
  pg_search_scope :search_by_full_text, against: [:name, :breed, :size, :gender, :special_needed, :location],
                                        using: {
                                          tsearch: { prefix: true }
                                        }

  # Combined search scope
  # scope :search_by_location_and_text,->(query, location) {
  #   results = search_by_full_text(query)
  #   # if !results.empty? && location.present?
  #   #   results.near(location, 500)
  #   # elsif location.present?
  #   #   raise
  #   #   Animal.all.near(location, 500)
  #   # end
  # }
end
