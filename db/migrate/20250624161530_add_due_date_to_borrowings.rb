class AddDueDateToBorrowings < ActiveRecord::Migration[7.2]
  def change
    add_column :borrowings, :due_date, :date
  end
end
