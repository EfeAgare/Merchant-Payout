class MerchantDisbursementsJob < ApplicationJob
  queue_as :default

  def perform
    return unless orders.any?

    orders.each do |order|
      MerchantDisbursementJob.perform_later(order.id, order.amount)
    end
  end

  private

  def orders
    Order.completed
  end
end
