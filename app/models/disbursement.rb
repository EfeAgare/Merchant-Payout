class Disbursement < ApplicationRecord
  belongs_to :order

  class << self
    def disburse_to_merchant(id, amount)
      create(order_id: id, amount: self.disburse_amount(amount))
    end

    def disburse_amount(amount)
      amount - (amount * percentage(amount))
    end

    def percentage(amount)
      if amount.between?(50, 300)
        0.0095
      elsif amount > 300
        0.0085
      else
        0.01
      end
    end
  end
end
