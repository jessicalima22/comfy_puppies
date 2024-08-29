class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions
  has_many :adopters, through: :adoptions, source: :user
  belongs_to :user
  has_one_attached :photo
end
