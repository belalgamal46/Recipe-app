class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :food
  has_many :recipe_foods

  validates :name, presence: true
  
  def admin?
    role == 'admin'
  end
end
