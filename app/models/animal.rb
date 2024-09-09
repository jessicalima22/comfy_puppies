class Animal < ApplicationRecord
  belongs_to :user
  has_one :adoption, dependent: :destroy
  has_one :adopter, through: :adoptions, source: :user
  has_many :chatrooms, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  validate :photos_count
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
  #
  private

  def photos_count

    if photos.attached? && photos.length > 4
      errors.add(:photos, 'You can upload a maximum of 4 photos.')
    end
  end
end
