class Book < ApplicationRecord
  validates :title, presence: true
  validates :pages, numericality: { greater_than: 0 }
  #Books relationships
  has_many :borrowings, dependent: :destroy
  has_many :borrowers, through: :borrowings, source: :user
end
