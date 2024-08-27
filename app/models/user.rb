class User < ApplicationRecord
  # has_many :animals, dependent: :destroy
  has_many :adoptions
  has_many :adopted_animals, through: :adoptions, source: :animal
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
