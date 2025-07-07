class HomeController < ApplicationController
  def index
  @books_count = Book.count
  @users_count = User.count
   @top_books = Book.joins(:borrowings)
                   .group('books.id')
                   .order('COUNT(borrowings.id) DESC')
                   .limit(3)
end

end
