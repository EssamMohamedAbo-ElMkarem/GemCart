class AdminController < ApplicationController
  layout("admin")
  before_action :authenticate_admin!
  def index
    @orders = Order.where(fulfilled: false).order(created_at: :desc).take(5)
    puts(@orders)
    @quick_stats = {
      sales: Order.all.count,
      revenue: Order.all.sum(:total).round,
      avg_sales: Order.all.average(:total).round,
      per_sales: OrderProduct.joins(:order).all.average(:quantity)
    }
    @orders_by_day = Order.where('created_at > ?', Time.now - 7.days).order(:created_at)
    @orders_by_day = @orders_by_day.group_by {|order| order.created_at.to_date}
    @revenue_by_day = @orders_by_day.map {|day, order| [day.strftime("%A"), order.sum(&:total)]}

    if @revenue_by_day.count < 7
      days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
      data_hash = @revenue_by_day.to_h
      current_day = Date.today.strftime("%A")
      current_day_index = days_of_week.index(current_day)
      next_day_index = (current_day_index + 1) % days_of_week.length
      ordered_days_With_current_past = days_of_week[next_day_index..-1] + days_of_week[0..next_day_index]
      complete_ordered_array_with_current_last = ordered_days_With_current_past.map{ |day| [day, data_hash.fetch(day, 0)] }
      @revenue_by_day = complete_ordered_array_with_current_last
    end
  end
end
