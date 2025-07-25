class CreateBorrowings < ActiveRecord::Migration[7.2]
  def change
    create_table :borrowings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :borrowed_on
      t.date :due_on
      t.date :returned_on
      t.boolean :extended

      t.timestamps
    end
  end
end
