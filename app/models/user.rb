class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         password_length: 8..50
  
  has_many :items, dependent: :destroy
  has_many :stylings, dependent: :destroy
end
