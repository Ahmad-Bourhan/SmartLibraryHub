class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book
  def return_date
  (returned_at || created_at + 14.days).to_date
end
end
