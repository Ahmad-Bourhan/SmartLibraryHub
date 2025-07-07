require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
    sign_in @user
    @book = books(:one)
    @borrowing = borrowings(:one)
  end

  test "should create borrowing" do
    post borrow_book_path(@book)
    assert_response :redirect
  end

  test "should get index" do
    get borrowings_path
    assert_response :success
  end

  test "should extend borrowing" do
    patch extend_borrowing_borrowing_path(@borrowing)
    assert_response :redirect
  end

  test "should return borrowing" do
    patch return_borrowing_path(@borrowing)
    assert_response :redirect
  end

  test "should get PDF receipt" do
    get receipt_pdf_borrowings_path
    assert_response :success
  end
end
