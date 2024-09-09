class User < ApplicationRecord
  # has_many :animals, dependent: :destroy
  has_many :adoptions
  has_many :adopted_animals, through: :adoptions, source: :animal
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  def animal_chatrooms
    Chatroom.joins(:animal).where(animals: {user_id: id})
  end

  def animal_adopter_chatrooms
    Chatroom.joins(:messages).where(messages: {user_id: id}).distinct
  end

  def chatrooms
    (animal_chatrooms + animal_adopter_chatrooms).uniq
  end
end
