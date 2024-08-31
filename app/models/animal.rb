class Animal < ApplicationRecord
  belongs_to :user
  has_one :adoptions
  #has_one :adopters, through: :adoptions, source: :user
  has_one_attached :photo
end
