class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def borrowings
    @all_borrowings = Borrowing.includes(:book, :user).where(returned_at: nil)
    @overdue_borrowings = @all_borrowings.where("due_date < ?", Date.today)
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
