class Admin::StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
  @daily_borrowings = Borrowing
    .where.not(returned_at: nil)
    .group("DATE(created_at)")
    .order("DATE(created_at)")
    .count

  @top_books = Borrowing
    .joins(:book)
    .group("books.title")
    .order("count_all DESC")
    .limit(5)
    .count

@user_roles = User.group(:role).count.transform_keys do |key|
      case key.to_s
      when "guest" then "Guests"
      when "user" then "Users"
      when "admin" then "Admins"
      else "Unknown"
      end
    end
end


  private

  def require_admin
    redirect_to root_path, alert: "Unauthorized access" unless current_user.admin?
  end
end
