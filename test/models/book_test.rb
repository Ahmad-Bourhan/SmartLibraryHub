require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "book is valid with title and pages > 0" do
    book = Book.new(title: "Ruby Basics", author: "Ahmad", pages: 100)
    assert book.valid?
  end

  test "book is invalid without title" do
    book = Book.new(author: "Ahmad", pages: 50)
    assert_not book.valid?
    assert_includes book.errors[:title], "can't be blank"
  end

  test "book is invalid with 0 or negative pages" do
    book = Book.new(title: "Bad Book", author: "Ahmad", pages: 0)
    assert_not book.valid?
    assert_includes book.errors[:pages], "must be greater than 0"
  end
end
