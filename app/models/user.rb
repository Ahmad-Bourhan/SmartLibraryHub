class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum :role, { guest: 0, user: 1, admin: 2 }


  after_initialize :set_default_role, if: :new_record?
  # User relationships
  has_many :borrowings, dependent: :destroy
  has_many :borrowed_books, through: :borrowings, source: :book

  private

  def set_default_role
    self.role ||= :user
  end
end
