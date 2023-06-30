class Food < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
end
