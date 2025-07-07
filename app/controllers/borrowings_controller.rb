require "prawn"

class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  # Action to borrow a book
  def create
    book = Book.find(params[:id])
    if current_user.borrowings.exists?(book: book, returned_at: nil)
      redirect_to books_path, alert: "You already borrowed this book."
    else
      current_user.borrowings.create(book: book, due_date: Date.today + 14.days)
      redirect_to books_path, notice: "You have borrowed the book successfully."
    end
  end

  # Show borrowings for current user or all (if admin)
  def index
    @borrowings = current_user.borrowings.includes(:book).where(returned_at: nil)

    if current_user.admin?
      @all_borrowings = Borrowing.includes(:book, :user).where(returned_at: nil)
      @overdue_borrowings = @all_borrowings.where("due_date < ?", Date.today)
    end
  end

  # Extend borrowing
  def extend_borrowing
    borrowing = current_user.borrowings.find(params[:id])
    if borrowing.returned_at.nil?
      if borrowing.due_date.present?
        borrowing.due_date += 3.days
      else
        borrowing.due_date = Date.today + 3.days
      end
      borrowing.save(validate: false)
      redirect_to borrowings_path, notice: "Borrowing extended by 3 days."
    else
      redirect_to borrowings_path, alert: "This book has already been returned."
    end
  end

  # Mark a borrowing as returned
  def return
    @borrowing = Borrowing.find(params[:id])
    if @borrowing.user == current_user || current_user.admin?
      @borrowing.update(returned_at: Time.current)
      redirect_to borrowings_path, notice: "Book returned successfully."
    else
      redirect_to borrowings_path, alert: "You are not authorized to return this book."
    end
  end

  # Generate PDF for current user's borrowings
  def receipt_pdf
    borrowings = current_user.borrowings.includes(:book).where(returned_at: nil)

    if borrowings.empty?
      redirect_to borrowings_path, alert: "You have no active borrowings."
      return
    end

    pdf = Prawn::Document.new
    pdf.text "Active Borrowings Receipt", size: 24, style: :bold, align: :center
    pdf.move_down 20

    borrowings.each_with_index do |borrowing, index|
      pdf.text "##{index + 1}", style: :bold
      pdf.text "Book Title: #{borrowing.book.title}"
      pdf.text "Author: #{borrowing.book.author}"
      pdf.text "Borrowed At: #{borrowing.created_at&.strftime('%B %d, %Y') || 'N/A'}"
      pdf.text "Return By: #{borrowing.due_date&.strftime('%B %d, %Y') || 'N/A'}"
      pdf.text "User: #{current_user.first_name} #{current_user.last_name}"
      pdf.move_down 10
      pdf.stroke_horizontal_rule
      pdf.move_down 10
    end

    send_data pdf.render,
              filename: "active_borrowings_#{current_user.id}.pdf",
              type: "application/pdf",
              disposition: "inline"
  end
end
