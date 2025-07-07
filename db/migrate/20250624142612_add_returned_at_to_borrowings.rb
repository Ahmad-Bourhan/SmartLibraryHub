class AddReturnedAtToBorrowings < ActiveRecord::Migration[7.2]
  def change
    add_column :borrowings, :returned_at, :datetime
  end
end
