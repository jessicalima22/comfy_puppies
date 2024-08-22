class Animal < ApplicationRecord
  has_many :adoptions
  has_many :adopters, through: :adoptions, source: :user
end
